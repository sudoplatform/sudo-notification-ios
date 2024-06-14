//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SudoLogging

internal extension Logger {

    /// Logger used internally in the SudoNotifiableClient.
    static let notifiableClientLogger = Logger(identifier: "SudoNotifiableClient", driver: NSLogDriver(level: .debug))
}
