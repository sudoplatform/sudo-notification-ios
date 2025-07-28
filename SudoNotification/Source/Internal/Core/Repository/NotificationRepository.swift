//
// Copyright © 2025 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//  

import Foundation

protocol NotificationRepository: AnyObject, Resetable {
    /// register for notification
    func registerNotification(device: NotificationDeviceInputProvider) async throws

    /// update notification registration
    func updateNotificationRegistration(device: NotificationDeviceInputProvider) async throws

    /// deregister for notification
    func deregisterNotification(device: NotificationDeviceInputProvider) async throws

    /// get device notification settings
    func getNotificationConfiguration(device: NotificationDeviceInputProvider) async throws -> NotificationConfiguration

    /// get user notification settings
    func getUserNotificationConfiguration(bundleId: String) async throws -> NotificationConfiguration?

    /// get user and device notification settings
    func getUserAndDeviceNotificationConfiguration(bundleId: String, deviceId: String) async throws -> UserAndDeviceNotificationConfiguration

    /// set device notification settings
    func setNotificationConfiguration(config: NotificationSettingsInput) async throws -> NotificationConfiguration

    /// set user notification settings
    func setUserNotificationConfiguration(config: UserNotificationSettingsInput) async throws -> NotificationConfiguration
}
