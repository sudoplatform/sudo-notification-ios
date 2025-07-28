//
// Copyright © 2025 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//  

import Foundation

/// Perform a query to get the notification settings
class GetUserAndDeviceNotificationConfigurationUseCase {
    
    let repository: NotificationRepository
    
    init(repository: NotificationRepository) {
        self.repository = repository
    }
    
    func execute(bundleId: String, deviceId: String) async throws -> UserAndDeviceNotificationConfiguration {
        return try await repository.getUserAndDeviceNotificationConfiguration(bundleId: bundleId, deviceId: deviceId)
    }
    
}
