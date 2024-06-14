//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//  

import Foundation

public struct DefaultNotificationDeviceInputProvider: NotificationDeviceInputProvider {
    public init(deviceIdentifier: String, pushToken: Data, voipToken: Data? = nil) {
        self.deviceIdentifier = deviceIdentifier
        self.pushToken = pushToken
        self.voipToken = voipToken
    }
    
    // MARK: - Properties: NotificationDeviceInputProvider

    public let deviceIdentifier: String
    public let pushToken: Data
    public let voipToken: Data?
    
    public var clientEnv: String {
        return "IOS"
    }
    
    public var buildType: String {
        #if DEBUG
            return "debug"
        #else
            return "release"
        #endif
    }

    public var appName: String {
        return Bundle.main.appName
    }

    public var bundleIdentifier: String {
        return Bundle.main.bundleIdentifier
    }

    public var appVersion: String {
        return Bundle.main.buildVersion
    }

    public var locale: String {
        return Locale.autoupdatingCurrent.identifier
    }
}
