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
            var status: Bool = false
            // There's an Amplify bug where enum properties cannot be accessed directly from the codegen types.  
            // https://github.com/aws-amplify/amplify-swift/issues/3953
            // As a workaround, the actionType property is extracted manually from the snapshot
            if let filterActionRawValue = conf.snapshot["actionType"] as? String,
               let filterAction = FilterAction(rawValue: filterActionRawValue)
            {
                status = filterAction == .enable
            }
            let filter = NotificationFilterItem(
                name: conf.serviceName,
                status: status,
                rules: conf.rule,
                meta: conf.enableMeta ?? "")
            configs.append(filter)
        }
        return NotificationConfiguration(configs: configs)
    }
}
