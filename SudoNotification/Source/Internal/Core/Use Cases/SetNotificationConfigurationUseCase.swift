//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//  

import Foundation

/// Perform a mutation to change the notification settings
class SetNotificationConfigurationUseCase {
    
    let repository: NotificationRepository
    
    init(repository: NotificationRepository) {
        self.repository = repository
    }
    
    func execute(config: NotificationSettingsInput) async throws -> NotificationConfiguration {
        return try await repository.setNotificationConfiguration(config: config)
    }
    
}
