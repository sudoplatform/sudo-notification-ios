//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public enum SudoNotifiableClientError: Error, Equatable, LocalizedError {
    /// Attempt to construct a DefaultSudoNotifiableClient was made with multiple instances of the same SDK notifiable
    /// client
    case duplicateNotifiableClient(_ serviceName: String)

    public static func == (lhs: SudoNotifiableClientError, rhs: SudoNotifiableClientError) -> Bool {
        switch (lhs, rhs) {
        case (.duplicateNotifiableClient(let lhsServiceName), .duplicateNotifiableClient(let rhsServiceName)):
            return lhsServiceName == rhsServiceName
        }
    }
}
