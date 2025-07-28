//
// Copyright © 2025 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoLogging
import SudoApiClient

class DefaultNotificationRepository: NotificationRepository {

    // MARK: - Properties

    /// Format we use for rendering device tokens in strings
    let deviceTokenFormat = "%02.2hhx"

    /// GraphQL client for peforming operations against the notification service.
    var graphQLClient: SudoApiClient

    /// Utility for transforming GraphQL types to the entity types defined within this SDK.
    let transformer = NotificationTransformer()

    /// Used to log diagnostic and error information.
    var logger: Logger

    // MARK: - Lifecycle

    init(graphQLClient: SudoApiClient, logger: Logger = .notificationSDKLogger) {
        self.graphQLClient = graphQLClient
        self.logger = logger
    }

    // MARK: - Conformance: NotificationRepository

    func registerNotification(device: NotificationDeviceInputProvider) async throws {
        let deviceInput = GraphQL.RegisterAppOnDeviceInput(
            build: GraphQL.buildType(rawValue: device.buildType.uppercased())!,
            bundleId: device.bundleIdentifier,
            clientEnv: GraphQL.clientEnvType(rawValue: device.clientEnv.uppercased())!,
            deviceId: device.deviceIdentifier,
            locale: device.locale,
            standardToken: device.pushToken.map { String(format: deviceTokenFormat, $0) }.joined(),
            version: device.appVersion,
            voipToken: device.voipToken?.map { String(format: deviceTokenFormat, $0)}.joined()
        )
        do {
            _ = try await graphQLClient.perform(mutation: GraphQL.RegisterAppOnDeviceMutation(input: deviceInput))
        } catch {
            throw SudoNotificationError.fromApiOperationError(error: error)
        }
    }

    func updateNotificationRegistration(device: NotificationDeviceInputProvider) async throws {
        let updateInput = GraphQL.UpdateInfoInput(
            build: GraphQL.buildType(rawValue: device.buildType.uppercased())!,
            bundleId: device.bundleIdentifier,
            deviceId: device.deviceIdentifier,
            locale: device.locale,
            standardToken: device.pushToken.map { String(format: deviceTokenFormat, $0)}.joined(),
            version: device.appVersion,
            voipToken: device.voipToken?.map { String(format: deviceTokenFormat, $0)}.joined()
        )

        do {
            _ = try await graphQLClient.perform(mutation: GraphQL.UpdateDeviceInfoMutation(input: updateInput))
        } catch {
            throw SudoNotificationError.fromApiOperationError(error: error)
        }
    }

    func deregisterNotification(device: NotificationDeviceInputProvider) async throws {
        do {
            let input = GraphQL.DeleteAppFromDeviceInput(bundleId: device.bundleIdentifier, deviceId: device.deviceIdentifier)
            _ = try await self.graphQLClient.perform(mutation: GraphQL.DeleteAppFromDeviceMutation(input: input))
        } catch {
            throw SudoNotificationError.fromApiOperationError(error: error)
        }
    }

    func getNotificationConfiguration(device: NotificationDeviceInputProvider) async throws -> NotificationConfiguration {
        do {
            let input = GraphQL.GetSettingsInput(bundleId: device.bundleIdentifier, deviceId: device.deviceIdentifier)
            let result = try await graphQLClient.fetch(query: GraphQL.GetNotificationSettingsQuery(input: input))
            return transformer.transform(result.getNotificationSettings.fragments.notificationSettingsOutput)
        } catch {
            throw SudoNotificationError.fromApiOperationError(error: error)
        }
    }

    func getUserNotificationConfiguration(bundleId: String) async throws -> NotificationConfiguration?
    {
        do {
            let result = try await graphQLClient.fetch(query: GraphQL.GetUserNotificationSettingsQuery(input: bundleId))
            
            let user = result.getUserAndDeviceNotificationSettings.user

            return user != nil ? transformer.transform(user!.fragments.notificationSettingsOutput) : nil
        } catch {
            throw SudoNotificationError.fromApiOperationError(error: error)
        }
    }

    func getUserAndDeviceNotificationConfiguration(bundleId: String, deviceId: String) async throws -> UserAndDeviceNotificationConfiguration
    {
        do {
            let input = GraphQL.GetUserAndDeviceSettingsInput(bundleId: bundleId, deviceId: deviceId)
            let result = try await graphQLClient.fetch(query: GraphQL.GetUserAndDeviceNotificationSettingsQuery(input: input))
            
            let user = result.getUserAndDeviceNotificationSettings.user
            let device = result.getUserAndDeviceNotificationSettings.device

            return UserAndDeviceNotificationConfiguration(
                user: user != nil ? transformer.transform(user!.fragments.notificationSettingsOutput) : nil,
                device: device != nil ? transformer.transform(device!.fragments.notificationSettingsOutput) : nil
            )
        } catch {
            throw SudoNotificationError.fromApiOperationError(error: error)
        }
    }

    func setNotificationConfiguration(config: NotificationSettingsInput) async throws -> NotificationConfiguration {
        let filter = config.filter.map {
            GraphQL.Filter(
                actionType: GraphQL.FilterAction(rawValue: $0.status) ?? GraphQL.FilterAction.disable,
                enableMeta: $0.meta,
                rule: $0.rules,
                serviceName: $0.name,
            )
        }
        let services = config.services.map { service in
            GraphQL.NotifiableServiceSchema(
                schema: service.schema.map { GraphQL.SchemaEntry(description: $0.description, fieldName: $0.fieldName, type: $0.type) },
                serviceName: service.serviceName,
            )
        }
        let configInput = GraphQL.UpdateSettingsInput(bundleId: config.bundleId, deviceId: config.deviceId, filter: filter, services: services)
        do {
            _ = try await graphQLClient.perform(mutation: GraphQL.UpdateNotificationSettingsMutation(input: configInput))
            return NotificationConfiguration(configs: config.filter)
        } catch {
            throw SudoNotificationError.fromApiOperationError(error: error)
        }
    }

    func setUserNotificationConfiguration(config: UserNotificationSettingsInput) async throws -> NotificationConfiguration {
        let filter = config.filter.map {
            GraphQL.Filter(
                actionType: GraphQL.FilterAction(rawValue: $0.status) ?? GraphQL.FilterAction.disable,
                enableMeta: $0.meta,
                rule: $0.rules,
                serviceName: $0.name,
            )
        }
        let services = config.services.map { service in
            GraphQL.NotifiableServiceSchema(
                schema: service.schema.map { GraphQL.SchemaEntry(description: $0.description, fieldName: $0.fieldName, type: $0.type) },
                serviceName: service.serviceName,
            )
        }
        do {
            _ = try await graphQLClient.perform(mutation: GraphQL.UpdateUserNotificationSettingsMutation(
                    bundleId: config.bundleId,
                    filter: filter,
                    services: services
            ))
            return NotificationConfiguration(configs: config.filter)
        } catch {
            throw SudoNotificationError.fromApiOperationError(error: error)
        }
    }

    func reset() {
        // Noop - nothing to reset
    }
}
