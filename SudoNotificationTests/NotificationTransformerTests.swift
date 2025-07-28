//
// Copyright © 2025 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import SudoApiClient
@testable import SudoNotification
import XCTest

final class NotificationTransformerTests: XCTestCase {

    // MARK: - Properties

    var instanceUnderTest: NotificationTransformer!

    // MARK: - Lifecycle

    override func setUp() {
        instanceUnderTest = NotificationTransformer()
    }

    // MARK: - Tests

    func test_transformGetNotificationSettingsQuery_withEnabledFilterAction_willReturnCorrectNotificatonConfiguration() throws {
        // given
        let filter = GraphQL.GetNotificationSettingsQuery.Data.GetNotificationSetting.Filter(
            serviceName: UUID().uuidString,
            actionType: .enable,
            rule: UUID().uuidString,
            enableMeta: UUID().uuidString
        )
        let data = GraphQL.GetNotificationSettingsQuery.Data.GetNotificationSetting(filter: [filter])
        let jsonEncodedData = GraphQL.GetNotificationSettingsQuery.Data.GetNotificationSetting(
            snapshot: data.snapshot.mapValues { $0.jsonValue as? JSONEncodable }
        )
        // when
        let result = instanceUnderTest.transform(jsonEncodedData.fragments.notificationSettingsOutput)
        // then
        XCTAssertEqual(result.configs.count, 1)
        let config = try XCTUnwrap(result.configs.first)
        XCTAssertEqual(config.name, filter.serviceName)
        XCTAssertEqual(config.status, NotificationConfiguration.enabledStatus)
        XCTAssertEqual(config.rules, filter.rule)
        XCTAssertEqual(config.meta, filter.enableMeta)
    }

    func test_transformGetNotificationSettingsQuery_withDisabledFilterAction_willReturnCorrectNotificatonConfiguration() throws {
        // given
        let filter = GraphQL.GetNotificationSettingsQuery.Data.GetNotificationSetting.Filter(
            serviceName: UUID().uuidString,
            actionType: .disable,
            rule: UUID().uuidString,
            enableMeta: UUID().uuidString
        )
        let data = GraphQL.GetNotificationSettingsQuery.Data.GetNotificationSetting(filter: [filter])
        let jsonEncodedData = GraphQL.GetNotificationSettingsQuery.Data.GetNotificationSetting(
            snapshot: data.snapshot.mapValues { $0.jsonValue as? JSONEncodable }
        )
        // when
        let result = instanceUnderTest.transform(jsonEncodedData.fragments.notificationSettingsOutput)
        // then
        XCTAssertEqual(result.configs.count, 1)
        let config = try XCTUnwrap(result.configs.first)
        XCTAssertEqual(config.name, filter.serviceName)
        XCTAssertEqual(config.status, NotificationConfiguration.disabledStatus)
        XCTAssertEqual(config.rules, filter.rule)
        XCTAssertEqual(config.meta, filter.enableMeta)
    }
}
