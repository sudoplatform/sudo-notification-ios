//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//  

import Foundation
import AWSAppSync
import SudoLogging
import SudoApiClient

class DefaultNotificationRepository: NotificationRepository {
    /// Format we use for rendering device tokens in strings
    let deviceTokenFormat = "%02.2hhx"

    /// GraphQL client for peforming operations against the notification service.
    var graphQLClient: SudoApiClient

    /// Used to log diagnostic and error information.
    var logger: Logger

    init(graphQLClient: SudoApiClient, logger: Logger = .notificationSDKLogger) {
        self.graphQLClient = graphQLClient
        self.logger = logger
    }

    /// register and update the device for push notification
    func registerNotification(device: NotificationDeviceInputProvider) async throws {
        let deviceInput = RegisterAppOnDeviceInput(bundleId: device.bundleIdentifier,
                                                   deviceId: device.deviceIdentifier,
                                                   clientEnv: clientEnvType(rawValue: device.clientEnv.uppercased())!,
                                                   standardToken: device.pushToken.map { String(format: deviceTokenFormat, $0) }.joined(),
                                                   voipToken: device.voipToken?.map { String(format: deviceTokenFormat, $0)}.joined(),
                                                   build: buildType(rawValue: device.buildType.uppercased()),
                                                   locale: device.locale,
                                                   version: device.appVersion)

        let (graphQLResult, graphQLError) = try await self.graphQLClient.perform(
            mutation: RegisterAppOnDeviceMutation(input: deviceInput))

        guard (graphQLResult?.data) != nil else {
            guard let error = graphQLError else {
                throw SudoNotificationError.fatalError("neither result nor error is non-nil after RegisterAppOnDeviceMutation")
            }
            throw SudoNotificationError.fromApiOperationError(error: error)
        }
    }

    /// Update device notification registration
    func updateNotificationRegistration(device: NotificationDeviceInputProvider) async throws {
        let updateInput = UpdateInfoInput(bundleId: device.bundleIdentifier,
                                          deviceId: device.deviceIdentifier,
                                          build: buildType(rawValue: device.buildType.uppercased()),
                                          locale: device.locale,
                                          standardToken: device.pushToken.map { String(format: deviceTokenFormat, $0)}.joined(),
                                          voipToken: device.voipToken?.map { String(format: deviceTokenFormat, $0)}.joined(),
                                          version: device.appVersion)

        let (graphQLResult, graphQLError) = try await self.graphQLClient.perform(
            mutation: UpdateDeviceInfoMutation(input: updateInput))

        guard (graphQLResult?.data) != nil else {
            guard let error = graphQLError else {
                throw SudoNotificationError.fatalError("neither result nor error is non-nil after UpdateDeviceInfoMutation")
            }
            throw SudoNotificationError.fromApiOperationError(error: error)
        }
    }

    func deregisterNotification(device: NotificationDeviceInputProvider) async throws {
        let (graphQLResult, graphQLError) = try await self.graphQLClient.perform(
            mutation: DeleteAppFromDeviceMutation(input: DeleteAppFromDeviceInput(bundleId: device.bundleIdentifier, deviceId: device.deviceIdentifier)))

        guard (graphQLResult?.data) != nil else {
            guard let error = graphQLError else {
                throw SudoNotificationError.fatalError("neither result nor error is non-nil after DeleteDeviceMutation")
            }
            throw SudoNotificationError.fromApiOperationError(error: error)
        }
    }

    func getNotificationConfiguration(device: NotificationDeviceInputProvider) async throws -> NotificationConfiguration {
        let (graphQLResult, graphQLError) = try await self.graphQLClient.fetch(
            query: GetNotificationSettingsQuery(input: GetSettingsInput(bundleId: device.bundleIdentifier, deviceId: device.deviceIdentifier)),
                cachePolicy: .fetchIgnoringCacheData)

        guard let result = graphQLResult?.data else {
            guard let error = graphQLError else {
                throw SudoNotificationError.fatalError("neither result nor error is non-nil after GetNotificationSettingsQuery")
            }
            throw SudoNotificationError.fromApiOperationError(error: error)
        }

        let transformer = NotificationTransformer()
        return transformer.transform(result.getNotificationSettings)
    }

    func setNotificationConfiguration(config: NotificationSettingsInput) async throws -> NotificationConfiguration {
        let filter = config.filter.map {
            Filter(serviceName: $0.name,
                   actionType: FilterAction(rawValue: $0.status) ?? FilterAction.disable,
                   rule: $0.rules,
                   enableMeta: $0.meta) }
        let services = config.services.map {
            let schema = $0.schema.map { schema in
                SchemaEntry(description: schema.description,
                            fieldName: schema.fieldName,
                            type: schema.type)
            }
            return NotifiableServiceSchema(serviceName: $0.serviceName,
                                    schema: schema)
        }
        let configInput = UpdateSettingsInput(bundleId: config.bundleId, deviceId: config.deviceId, filter: filter, services: services)
        let (graphQLResult, graphQLError) = try await self.graphQLClient.perform(
            mutation: UpdateNotificationSettingsMutation(input: configInput))

        guard (graphQLResult?.data) != nil else {
            guard let error = graphQLError else {
                throw SudoNotificationError.fatalError("neither result nor error is non-nil after UpdateNotificationSettingsMutation")
            }
            throw SudoNotificationError.fromApiOperationError(error: error)
        }
        return NotificationConfiguration(configs: config.filter)
    }

    func reset() {
        // Noop - nothing to reset
    }

}
