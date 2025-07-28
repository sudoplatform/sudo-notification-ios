//
// Copyright © 2025 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//  

import Foundation

/// Perform a query to get the notification settings
class GetUserNotificationConfigurationUseCase {
    
    let repository: NotificationRepository
    
    init(repository: NotificationRepository) {
        self.repository = repository
    }
    
    func execute(bundleId: String) async throws -> NotificationConfiguration? {
        return try await repository.getUserNotificationConfiguration(bundleId: bundleId)
    }
    
}
