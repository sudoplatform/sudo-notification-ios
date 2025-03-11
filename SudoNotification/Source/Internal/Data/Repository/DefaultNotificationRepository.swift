//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
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
        let deviceInput = RegisterAppOnDeviceInput(
            bundleId: device.bundleIdentifier,
            deviceId: device.deviceIdentifier,
            clientEnv: clientEnvType(rawValue: device.clientEnv.uppercased())!,
            standardToken: device.pushToken.map { String(format: deviceTokenFormat, $0) }.joined(),
            voipToken: device.voipToken?.map { String(format: deviceTokenFormat, $0)}.joined(),
            build: buildType(rawValue: device.buildType.uppercased()),
            locale: device.locale,
            version: device.appVersion
        )
        do {
            _ = try await graphQLClient.perform(mutation: RegisterAppOnDeviceMutation(input: deviceInput))
        } catch {
            throw SudoNotificationError.fromApiOperationError(error: error)
        }
    }

    func updateNotificationRegistration(device: NotificationDeviceInputProvider) async throws {
        let updateInput = UpdateInfoInput(
            bundleId: device.bundleIdentifier,
            deviceId: device.deviceIdentifier,
            build: buildType(rawValue: device.buildType.uppercased()),
            locale: device.locale,
            standardToken: device.pushToken.map { String(format: deviceTokenFormat, $0)}.joined(),
            voipToken: device.voipToken?.map { String(format: deviceTokenFormat, $0)}.joined(),
            version: device.appVersion
        )

        do {
            _ = try await graphQLClient.perform(mutation: UpdateDeviceInfoMutation(input: updateInput))
        } catch {
            throw SudoNotificationError.fromApiOperationError(error: error)
        }
    }

    func deregisterNotification(device: NotificationDeviceInputProvider) async throws {
        do {
            let input = DeleteAppFromDeviceInput(bundleId: device.bundleIdentifier, deviceId: device.deviceIdentifier)
            _ = try await self.graphQLClient.perform(mutation: DeleteAppFromDeviceMutation(input: input))
        } catch {
            throw SudoNotificationError.fromApiOperationError(error: error)
        }
    }

    func getNotificationConfiguration(device: NotificationDeviceInputProvider) async throws -> NotificationConfiguration {
        do {
            let input = GetSettingsInput(bundleId: device.bundleIdentifier, deviceId: device.deviceIdentifier)
            let result = try await graphQLClient.fetch(query: GetNotificationSettingsQuery(input: input))
            return transformer.transform(result.getNotificationSettings)
        } catch {
            throw SudoNotificationError.fromApiOperationError(error: error)
        }
    }

    func setNotificationConfiguration(config: NotificationSettingsInput) async throws -> NotificationConfiguration {
        let filter = config.filter.map {
            Filter(
                serviceName: $0.name,
                actionType: FilterAction(rawValue: $0.status) ?? FilterAction.disable,
                rule: $0.rules,
                enableMeta: $0.meta
            )
        }
        let services = config.services.map { service in
            NotifiableServiceSchema(
                serviceName: service.serviceName,
                schema: service.schema.map { SchemaEntry(description: $0.description, fieldName: $0.fieldName, type: $0.type) }
            )
        }
        let configInput = UpdateSettingsInput(bundleId: config.bundleId, deviceId: config.deviceId, filter: filter, services: services)
        do {
            _ = try await graphQLClient.perform(mutation: UpdateNotificationSettingsMutation(input: configInput))
            return NotificationConfiguration(configs: config.filter)
        } catch {
            throw SudoNotificationError.fromApiOperationError(error: error)
        }
    }

    func reset() {
        // Noop - nothing to reset
    }
}
