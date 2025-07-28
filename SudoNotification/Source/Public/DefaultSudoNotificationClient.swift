//
// Copyright © 2025 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//  

import SudoApiClient
import SudoLogging
import SudoUser
import SudoConfigManager
import PushKit

/// Default Client API Endpoint for interacting with the Notification Service.
public class DefaultSudoNotificationClient: SudoNotificationClient {

    /// GraphQL client for peforming operations against the notification service.
    let graphQLClient: SudoApiClient

    /// Used to log diagnostic and error information.
    let logger: Logger

    /// Utility factory class to generate use cases.
    let useCaseFactory: UseCaseFactory

    /// Repository that does the work of interacting with the service via GraphQL
    let repository: NotificationRepository

    // Configured notifying services
    public let notifiableServices: [SudoNotificationFilterClient]

    // User client used to sign-in prior to accessing service
    let userClient: SudoUserClient

    var allResetables: [Resetable] {
        return [
            repository
        ]
    }

    /// Initialize an instance of `DefaultSudoNotificationClient`. It uses configuration parameters defined in `sudoplatformconfig.json` file located in the app
    /// bundle.
    /// - Parameters:
    ///   - userClient: SudoUserClient instance used for authentication.
    /// Throws:
    ///     - `SudoNotificationError` if invalid config.
    public convenience init(userClient: SudoUserClient, notifiableServices: [SudoNotificationFilterClient], graphQLClient: SudoApiClient? = nil) throws {
        var apiClient: SudoApiClient?
        guard let configManager = SudoConfigManagerFactory.instance.getConfigManager(name: SudoConfigManagerFactory.Constants.defaultConfigManagerName),
              configManager.getConfigSet(namespace: "apiService") != nil else {
            throw SudoNotificationError.invalidConfig
        }

        guard let notificationConfig = configManager.getConfigSet(
            namespace: Constants.Namespace.notificationService
        ) else {
            throw SudoNotificationError.notificationServiceConfigNotFound
        }

        // The old way of identifying notifiable services was via a notifiableServices
        // item in notificationService sudoplatformconfig.json stanza.
        //
        // The new way looks for a "notifiable: true" element in the service's own
        // sudoplatformconfig.json stanza
        //
        // For backwards compatibility we look for notifiableServices defined the old
        // way as well as the new way.

        let notifyingApps: [String] = notificationConfig[Constants.Config.notifiableServices] as? [String] ??
            []

        for nc in notifiableServices {
            // Old way
            if notifyingApps.contains(nc.serviceName) {
                continue
            }

            // New way
            let config = configManager.getConfigSet(namespace: nc.serviceName) ?? [:]
            guard let notifiable = config[Constants.Config.notifiable] as? Bool, notifiable else {
                throw SudoNotificationError.invalidConfig
            }

            // Notifiable!
        }

        // notifiable clients are all good.

        if graphQLClient != nil {
            apiClient = graphQLClient!
        } else {
            apiClient = try? SudoApiClientManager.instance?.getClient(
                sudoUserClient: userClient,
                configNamespace: Constants.Namespace.notificationService
            )
            if apiClient == nil {
                throw SudoNotificationError.invalidConfig
            }
        }

        let preConstructedRepository = DefaultNotificationRepository(graphQLClient: apiClient!)
        self.init(
            graphQLClient: apiClient!,
            userClient: userClient,
            useCaseFactory: UseCaseFactory(repository: preConstructedRepository),
            repository: preConstructedRepository,
            notifiableServices: notifiableServices
        )
    }

    /// Initialize an instance of `DefaultNotificationClient`.
    ///
    /// This is used internally for injection and mock testing.
    init(
        graphQLClient: SudoApiClient,
        userClient: SudoUserClient,
        useCaseFactory: UseCaseFactory,
        repository: NotificationRepository,
        notifiableServices: [SudoNotificationFilterClient],
        logger: Logger = .notificationSDKLogger
    ) {
        self.graphQLClient = graphQLClient
        self.logger = logger
        self.useCaseFactory = useCaseFactory
        self.repository = repository
        self.notifiableServices = notifiableServices
        self.userClient = userClient
    }

    public func reset() throws {
        allResetables.forEach { $0.reset() }
    }

    public func getNotificationConfiguration(device: NotificationDeviceInputProvider) async throws -> NotificationConfiguration {
        guard try await userClient.isSignedIn() else {
            throw SudoNotificationError.notSignedIn
        }

        let useCase = useCaseFactory.generateGetNotificationConfigurationUseCase()
        return try await useCase.execute(device: device)
    }

    public func getUserNotificationConfiguration(bundleId: String) async throws -> NotificationConfiguration? {
        guard try await userClient.isSignedIn() else {
            throw SudoNotificationError.notSignedIn
        }

        let useCase = useCaseFactory.generateGetUserNotificationConfigurationUseCase()
        return try await useCase.execute(bundleId: bundleId)
    }

    public func getUserAndDeviceNotificationConfiguration(device: NotificationDeviceInputProvider) async throws -> UserAndDeviceNotificationConfiguration {
        guard try await userClient.isSignedIn() else {
            throw SudoNotificationError.notSignedIn
        }

        let useCase = useCaseFactory.generateGetUserAndDeviceNotificationConfigurationUseCase()
        return try await useCase.execute(bundleId: device.bundleIdentifier, deviceId: device.deviceIdentifier)
    }

    public func setNotificationConfiguration(config: NotificationSettingsInput) async throws -> NotificationConfiguration {
        guard try await userClient.isSignedIn() else {
            throw SudoNotificationError.notSignedIn
        }

        let useCase = useCaseFactory.generateSetNotificationConfigurationUseCase()
        return try await useCase.execute(config: config)
    }

    public func setUserNotificationConfiguration(config: UserNotificationSettingsInput) async throws -> NotificationConfiguration {
        guard try await userClient.isSignedIn() else {
            throw SudoNotificationError.notSignedIn
        }

        let useCase = useCaseFactory.generateSetUserNotificationConfigurationUseCase()
        return try await useCase.execute(config: config)
    }

    public func registerNotification(device: NotificationDeviceInputProvider) async throws {
        guard try await userClient.isSignedIn() else {
            throw SudoNotificationError.notSignedIn
        }

        let useCase = useCaseFactory.generateRegisterNotificationUseCase()
        return try await useCase.execute(device: device)
    }

    public func updateNotificationRegistration(device: NotificationDeviceInputProvider) async throws {
        guard try await userClient.isSignedIn() else {
            throw SudoNotificationError.notSignedIn
        }

        let useCase = useCaseFactory.generateUpdateNotificationRegitrationUseCase()
        return try await useCase.execute(device: device)
    }

    public func deRegisterNotification(device: NotificationDeviceInputProvider) async throws {
        guard try await userClient.isSignedIn() else {
            throw SudoNotificationError.notSignedIn
        }

        let useCase = useCaseFactory.generateDeRegisterNotificationUseCase()
        return try await useCase.execute(device: device)
    }
}
