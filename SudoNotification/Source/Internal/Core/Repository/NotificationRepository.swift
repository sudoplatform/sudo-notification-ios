//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
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

    /// get notification settings
    func getNotificationConfiguration(device: NotificationDeviceInputProvider) async throws -> NotificationConfiguration

    /// set notification settings
    func setNotificationConfiguration(config: NotificationSettingsInput) async throws -> NotificationConfiguration
}
