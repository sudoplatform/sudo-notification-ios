//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// Client used to provide filter schema information to the notification SDk. Each Sudo Platform service SDK that has
/// notifications provides an implementation of this protocol that must be passed to `DefaultSudoNotificationClient`
/// on construction.
public protocol SudoNotificationFilterClient {
    /// Name of service for the implementing Sudo Platform SDK. Matches the corresponding service's configuration
    /// section within sudoplatformconfig.json
    var serviceName: String { get }

    /// Return the schema describing properties available for filtering for the specific service
    func getSchema() -> NotificationMetaData
}

public struct NotificationMetaData {
    /// Name of service for the implementing Sudo Platform SDK. Matches the corresponding service's configuration
    /// section within sudoplatformconfig.json
    let serviceName: String

    /// Array of schema entries, one for each filterable property
    let schema: [NotificationSchemaEntry]

    public init(serviceName: String, schema: [NotificationSchemaEntry]) {
        self.serviceName = serviceName
        self.schema = schema
    }
}

public struct NotificationSchemaEntry {
    /// Description of the fitlerable property
    public let description: String

    /// Name of the filterable property
    public let fieldName: String

    /// Type of the filterable property
    public let type: String

    public init(description: String, fieldName: String, type: String) {
        self.description = description
        self.fieldName = fieldName
        self.type = type
    }
}
