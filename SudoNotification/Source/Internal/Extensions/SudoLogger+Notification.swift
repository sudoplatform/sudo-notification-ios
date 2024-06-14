//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//  

import SudoLogging

internal extension Logger {

    /// Logger used internally in the SudoNotification.
    static let notificationSDKLogger = Logger(identifier: "SudoNotification", driver: NSLogDriver(level: .debug))
}
