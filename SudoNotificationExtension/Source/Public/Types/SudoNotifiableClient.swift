//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import UserNotifications
import PushKit

/// Client used to decode service specific notification data. Each Sudo Platform service SDK that has notifications
/// provides an implementation of this protocol that must be passed to `DefaultSudoNotifiableClient` on construction.
public protocol SudoNotifiableClient {
    /// Name of service for the implementing Sudo Platform SDK. Matches the corresponding service's configuration
    /// section within sudoplatformconfig.json
    var serviceName: String { get }

    /// Decode opaque, serialized service specific notification data
    ///
    /// - Parameters:
    ///   - data: Opaque, serialized service specific notification data
    /// - Returns: Service specific implementation of `SudoNotification` decoded from the data
    func decode(data: String) -> any SudoNotification
}
