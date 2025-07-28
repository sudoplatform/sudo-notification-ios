//
// Copyright © 2025 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//  

import Foundation

/// Perform a mutation to change the notification settings
class SetUserNotificationConfigurationUseCase {
    
    let repository: NotificationRepository
    
    init(repository: NotificationRepository) {
        self.repository = repository
    }
    
    func execute(config: UserNotificationSettingsInput) async throws -> NotificationConfiguration {
        return try await repository.setUserNotificationConfiguration(config: config)
    }
    
}
