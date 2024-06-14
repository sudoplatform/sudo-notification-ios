//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//  

import SudoUser
import SudoLogging
import PushKit

/// Client used to interface with the Sudo Notification Platform service.
///
/// It is recommended to code to this interface, rather than the implementation class (`DefaultSudoNotificationClient`) as
/// the implementation class is only meant to be used for initializing an instance of the client.
public protocol SudoNotificationClient: AnyObject {

    // Configured notifying service clients
    var notifiableServices: [SudoNotificationFilterClient] { get }

    // MARK: - Lifecycle

    /// Clear all locally cached data
    func reset() throws

    // MARK: - Queries

    /// Get the current set of notification configuration on this device
    /// - Returns:
    ///   - Success: The set of notification configurations the user currently set for this device
    /// - Throws:
    ///   - `SudoNotificationError`
    func getNotificationConfiguration(device: NotificationDeviceInputProvider) async throws -> NotificationConfiguration

    // MARK: - Mutations

    /// DeRgister for push notification for the user on this device
    ///  - Parameters:
    ///     - device: Device profile for the push notification
    ///  - Returns:
    ///    - Success: True
    ///  - Throws:
    ///    - `SudoNotificationError`
    func deRegisterNotification(device: NotificationDeviceInputProvider) async throws

    /// Register for push notification for the user on this device
    ///  - Parameters:
    ///     - device: Device profile for the push notification
    ///  - Returns:
    ///    - Success: True
    ///  - Throws:
    ///    - `SudoNotificationError`
    func registerNotification(device: NotificationDeviceInputProvider) async throws

    /// Set the notification configuration for the user.
    /// - Returns:
    ///   - The current set of configuration the user has on this device after the set action has completed.
    /// - Throws:
    ///     `SudoNotificationError`.
    func setNotificationConfiguration(config: NotificationSettingsInput) async throws -> NotificationConfiguration

    /// Update push notification registration for the user on this device
    ///  - Parameters:
    ///     - device: Device profile for the push notification
    ///  - Returns:
    ///    - Success: True
    ///  - Throws:
    ///    - `SudoNotificationError`
    func updateNotificationRegistration(device: NotificationDeviceInputProvider) async throws
}
