//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Base SudoNotification protocol. Service specific SDKs provide concrete classes implementing this
/// protocol that will be returned by `SudoNotifiableClient.decodeData`
public protocol SudoNotification {
    /// Name of service for the implementing Sudo Platform SDK. Matches the corresponding service's configuration
    /// section within sudoplatformconfig.json
    var serviceName: String { get }

    /// Type of notification specific to the service
    var type: String { get }
}
