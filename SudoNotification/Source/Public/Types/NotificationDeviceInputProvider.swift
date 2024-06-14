//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//  

import Foundation

/// `NotificationDeviceInputProvider` conforming instances are required to provide an accurate representation of the current device information.
/// Primarily used with registrations.
public protocol NotificationDeviceInputProvider {

    /// String representation of the build type to assign to a device or device info.
    var buildType: String { get }
    
    /// String representation of client env (OS)
    var clientEnv: String { get }

    /// Unique identifier for the device.
    var deviceIdentifier: String { get }

    /// App name, e.g. "MYSUDO". Used to route the push notifications to the correct app.
    var appName: String { get }

    /// The bundle identifier to assign to any devices or device info.
    var bundleIdentifier: String { get }

    /// String representation of the application version a device is for.
    var appVersion: String { get }

    /// The locale identifier for the device.
    var locale: String { get }

    /// The registered APNs token used for delivering push notifications.
    var pushToken: Data { get }

    /// The registered `PushKit` voip token used for delivering voip/call notifications.
    var voipToken: Data? { get }
}

func == (lhs: NotificationDeviceInputProvider, rhs: NotificationDeviceInputProvider) -> Bool {
    return lhs.buildType == rhs.buildType &&
        lhs.clientEnv == rhs.clientEnv &&
        lhs.deviceIdentifier == rhs.deviceIdentifier &&
        lhs.appName == rhs.appName &&
        lhs.bundleIdentifier == rhs.bundleIdentifier &&
        lhs.locale == rhs.locale &&
        lhs.appVersion == rhs.appVersion &&
        lhs.pushToken == rhs.pushToken &&
        lhs.voipToken == rhs.voipToken
}
