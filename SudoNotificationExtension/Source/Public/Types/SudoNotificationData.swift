//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

///
public struct SudoNotificationData: Equatable {
    /// Name of service for the implementing Sudo Platform SDK. Matches the corresponding service's configuration
    /// section within sudoplatformconfig.json
    public let serviceName: String

    /// Opaque, serialized service specific notification data
    public let data: String?
}
