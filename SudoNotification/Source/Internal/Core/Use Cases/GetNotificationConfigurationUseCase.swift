//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//  

import Foundation

/// Perform a query to get the notification settings
class GetNotificationConfigurationUseCase {
    
    let repository: NotificationRepository
    
    init(repository: NotificationRepository) {
        self.repository = repository
    }
    
    func execute(device: NotificationDeviceInputProvider) async throws -> NotificationConfiguration {
        return try await repository.getNotificationConfiguration(device: device)
    }
    
}
