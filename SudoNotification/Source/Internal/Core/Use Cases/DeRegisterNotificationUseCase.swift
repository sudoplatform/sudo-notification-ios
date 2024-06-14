//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//  

import Foundation

/// Perform a mutation of the notification service to deregister a device
class DeRegisterNotificationUseCase {

    let repository: NotificationRepository

    init(repository: NotificationRepository) {
        self.repository = repository
    }

    func execute(device: NotificationDeviceInputProvider) async throws {
        return try await repository.deregisterNotification(device: device)
    }

}
