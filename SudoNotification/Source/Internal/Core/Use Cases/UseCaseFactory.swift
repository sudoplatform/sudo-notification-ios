//
// Copyright © 2025 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//  

import Foundation

/// Utility class for generating use cases from the core level of the SDK in the consumer/API level.
class UseCaseFactory {
    
    private var repository: NotificationRepository
    
    init(repository: NotificationRepository) {
        self.repository = repository
    }
    
    func generateRegisterNotificationUseCase() -> RegisterNotificationUseCase {
        return RegisterNotificationUseCase(repository: repository)
    }
    
    func generateDeRegisterNotificationUseCase() -> DeRegisterNotificationUseCase {
        return DeRegisterNotificationUseCase(repository: repository)
    }
    
    func generateGetNotificationConfigurationUseCase() -> GetNotificationConfigurationUseCase {
        return GetNotificationConfigurationUseCase(repository: repository)
    }
    
    func generateGetUserNotificationConfigurationUseCase() -> GetUserNotificationConfigurationUseCase {
        return GetUserNotificationConfigurationUseCase(repository: repository)
    }
    
    func generateGetUserAndDeviceNotificationConfigurationUseCase() -> GetUserAndDeviceNotificationConfigurationUseCase {
        return GetUserAndDeviceNotificationConfigurationUseCase(repository: repository)
    }
    
    func generateSetNotificationConfigurationUseCase() -> SetNotificationConfigurationUseCase {
        return SetNotificationConfigurationUseCase(repository: repository)
    }
    
    func generateSetUserNotificationConfigurationUseCase() -> SetUserNotificationConfigurationUseCase {
        return SetUserNotificationConfigurationUseCase(repository: repository)
    }
    
    func generateUpdateNotificationRegitrationUseCase() -> UpdateNotificationUseCase {
        return UpdateNotificationUseCase(repository: repository)
    }
}
