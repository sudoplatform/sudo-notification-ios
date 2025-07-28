//
// Copyright © 2025 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public struct UserAndDeviceNotificationConfiguration {
    public let user: NotificationConfiguration?
    public let device: NotificationConfiguration?
    
    public init(user: NotificationConfiguration? = nil, device: NotificationConfiguration? = nil) {
        self.user = user
        self.device = device
    }
}
