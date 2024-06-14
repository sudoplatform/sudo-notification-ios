//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public struct Constants {
    /// Configuration namespace.
    public struct Namespace {
        static let notificationService = "notificationService"
    }
    public struct Config {
        /// Boolean parameter in every service indicating whether or not it is notifiable
        static let notifiable = "notifiable"

        /// Deprecated array of services in notificationService namespace
        static let notifiableServices = "notifiableServices"
    }
}
