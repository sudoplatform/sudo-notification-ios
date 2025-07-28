//
// Copyright © 2025 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//  

import Foundation

public struct NotificationConfiguration {
    public static let defaultRuleString = """
                                            {"==": [1, 1]}
                                            """
    public static let enabledStatus = "ENABLE"
    public static let disabledStatus = "DISABLE"

    /// The user's current configuration
    let version: String = "v1"
    public var configs: [NotificationFilterItem]

    public init(configs: [NotificationFilterItem]) {
        self.configs = configs
    }

    public mutating func updateConfig(uuid: UUID, status: Bool, rules: String = "", meta: String = "") {
        if let idx = self.configs.firstIndex(where: {$0.uuid == uuid}) {
            self.configs[idx].status = status ? Self.enabledStatus : Self.disabledStatus
            if !rules.isEmpty {
                self.configs[idx].rules = rules
            }
            if !meta.isEmpty {
                self.configs[idx].meta = meta
            }
        }
    }
}

public struct NotificationFilterItem {
    public var uuid: UUID
    public var name: String
    public var status: String
    public var rules: String
    public var meta: String

    public init(name: String, status: Bool = true, rules: String = "", meta: String = "") {
        self.uuid = UUID()
        self.name = name
        self.status = status
            ? NotificationConfiguration.enabledStatus
            : NotificationConfiguration.disabledStatus
        self.rules = rules.isEmpty
            ? NotificationConfiguration.defaultRuleString
            : rules
        self.meta = meta
    }
}

public struct NotificationSettingsInput {
    public init(bundleId: String, deviceId: String, filter: [NotificationFilterItem], services: [NotificationMetaData]) {
        self.bundleId = bundleId
        self.deviceId = deviceId
        self.filter = filter
        self.services = services
    }

    public var bundleId: String
    public var deviceId: String
    public var filter: [NotificationFilterItem]
    public var services: [NotificationMetaData]
}

public struct UserNotificationSettingsInput {
    public init(bundleId: String, filter: [NotificationFilterItem], services: [NotificationMetaData]) {
        self.bundleId = bundleId
        self.filter = filter
        self.services = services
    }

    public var bundleId: String
    public var filter: [NotificationFilterItem]
    public var services: [NotificationMetaData]
}
