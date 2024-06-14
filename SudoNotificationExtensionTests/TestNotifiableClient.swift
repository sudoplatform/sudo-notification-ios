//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
@testable import SudoNotificationExtension

public struct TestSudoNotification: SudoNotification, Equatable {
    public let serviceName: String
    public let type: String
    public let f1: String?
    public let f2: String?
}

public struct ErrorSudoNotification: SudoNotification {
    public let serviceName = "SampleService"
    public let type = "error"
    public let error: Error
}

public struct TestNotifiableClient: SudoNotifiableClient {
    private let _serviceName: String

    public var serviceName: String { return _serviceName }

    public init(_ serviceName: String) {
        self._serviceName = serviceName
    }

    public func decode(data: String) -> any SudoNotification {
        struct EncodedTestSudoNotification: Decodable {
            public let type: String
            public let f1: String?
            public let f2: String?
        }

        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(EncodedTestSudoNotification.self, from: data.data(using: .utf8)!)
            return TestSudoNotification(serviceName: serviceName, type: decoded.type, f1: decoded.f1, f2: decoded.f2)
        } catch {
            return ErrorSudoNotification(error: error)
        }
    }
}
