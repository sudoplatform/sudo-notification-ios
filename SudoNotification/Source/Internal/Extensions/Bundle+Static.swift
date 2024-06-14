//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//  

import Foundation

private final class BundleLocator {}

extension Bundle {

    /// To support consumers who need to consume the UI library via cocoapods as a static library we
    /// need to ensure that the bundle is loaded from the main bundle if possible.
    internal static var sdkBundle: Bundle {
        let bundleForClass = Bundle(for: BundleLocator.self)
        guard
            let path = bundleForClass.path(forResource: "SudoNotification", ofType: "bundle"),
            let resolvedBundle = Bundle(path: path)
        else {
            return bundleForClass
        }
        return resolvedBundle
    }

    /// Will return the bundle display name string.
    var appName: String {
        guard let result = infoDictionary?["CFBundleName"] as? String else {
            return "Unknown"
        }
        return result
    }

    /// Will return the current bundle identifier.
    var bundleIdentifier: String {
        guard let result = infoDictionary?["CFBundleIdentifier"] as? String else {
            return "com.unknown.bundle"
        }
        return result
    }

    /// Will return the app bundle version short string.
    var buildVersion: String {
        guard let result = infoDictionary?["CFBundleShortVersionString"] as? String else {
            return "1.0.0"
        }
        return result
    }

    /// Will return the app bundle build number string.
    var buildNumber: String {
        guard let result = infoDictionary?["CFBundleVersion"] as? String else {
            return "0"
        }
        return result
    }
}
