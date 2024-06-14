//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//  

import Foundation

struct NotificationTransformer {
/// Transformer for GraphQL types to output results of the SDK.
    func transform(_ result: GetNotificationSettingsQuery.Data.GetNotificationSetting) -> NotificationConfiguration {
        let configData = result.filter
        if configData.isEmpty {
            return NotificationConfiguration(configs: [])
        }
        var configs: [NotificationFilterItem] = []
        for conf in configData {
            guard let conf = conf else {
                continue
            }
            let enabledFilter = FilterAction(rawValue: "ENABLE")
            let filter = NotificationFilterItem(
                name: conf.serviceName,
                status: conf.actionType == enabledFilter,
                rules: conf.rule,
                meta: conf.enableMeta ?? "")
            configs.append(filter)
        }

        return NotificationConfiguration(configs: configs)
    }
}
