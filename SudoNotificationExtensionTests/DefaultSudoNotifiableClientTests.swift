//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import PushKit

@testable import SudoNotificationExtension

class TestPKPushPayload: PKPushPayload {
    private let _type: PKPushType
    private let _dictionaryPayload: [AnyHashable: Any]

    override var type: PKPushType { return _type }
    override var dictionaryPayload: [AnyHashable: Any] { return _dictionaryPayload }

    init(type: PKPushType, dictionaryPayload: [AnyHashable: Any]) {
        self._type = type
        self._dictionaryPayload = dictionaryPayload
    }
}

final class DefaultSudoNotifiableClientTests: XCTestCase {

    let client1 = TestNotifiableClient("client-1")
    let client2 = TestNotifiableClient("client-2")

    // MARK: - init

    func testConstructionShouldThrowDuplicateNotifiableError() {
        let thrown: AnyError?
        do {
            _ = try DefaultSudoNotifiableClient(notifiableClients: [
                client1, client1
            ])
            thrown = nil
        } catch {
            thrown = AnyError(error)
        }

        XCTAssertEqual(thrown, AnyError(SudoNotifiableClientError.duplicateNotifiableClient(client1.serviceName)))
    }

    // MARK: - extractData fromPKPush

    func testExtractDataFromPKPushShouldReturnNilIfNotVoIP() throws {
        let iut = try DefaultSudoNotifiableClient(notifiableClients: [client1, client2])

        let extracted = iut.extractData(
            fromPKPush: TestPKPushPayload(
                type: PKPushType.fileProvider,
                dictionaryPayload: ["sudoplatform": ["servicename": client1.serviceName]]))

        XCTAssertNil(extracted)
    }

    func testExtractDataFromPKPushShouldReturnNilIfUnrecognizedDictionaryType() throws {
        let iut = try DefaultSudoNotifiableClient(notifiableClients: [client1, client2])

        let extracted = iut.extractData(
            fromPKPush: TestPKPushPayload(
                type: PKPushType.voIP,
                dictionaryPayload: [1: 2, "sudoplatform": ["servicename": client1.serviceName]]))

        XCTAssertNil(extracted)
    }

    func testExtractDataFromPKPushShouldReturnNilIfMissingSudoplatformKey() throws {
        let iut = try DefaultSudoNotifiableClient(notifiableClients: [client1, client2])

        let extracted = iut.extractData(fromPKPush: TestPKPushPayload(type: PKPushType.voIP, dictionaryPayload: ["not-sudoplatform": "something"]))

        XCTAssertNil(extracted)
    }

    func testExtractDataFromPKPushShouldReturnNilIfSudoplatformKeyHasNoServicename() throws {
        let iut = try DefaultSudoNotifiableClient(notifiableClients: [client1, client2])

        let extracted = iut.extractData(fromPKPush: TestPKPushPayload(type: PKPushType.voIP, dictionaryPayload: ["sudoplatform": ["data": "somedata"]]))

        XCTAssertNil(extracted)
    }

    func testExtractDataFromPKPushShouldReturnDataWithNilDataIfSudoplatformKeyHasNoData() throws {
        let iut = try DefaultSudoNotifiableClient(notifiableClients: [client1, client2])

        let extracted = iut.extractData(
            fromPKPush: TestPKPushPayload(
                type: PKPushType.voIP,
                dictionaryPayload: ["sudoplatform": ["servicename": client1.serviceName]]))

        XCTAssertEqual(extracted, SudoNotificationData(serviceName: client1.serviceName, data: nil))
    }

    func testExtractDataFromPKPushShouldReturnData() throws {
        let iut = try DefaultSudoNotifiableClient(notifiableClients: [client1, client2])

        let data = "some-data"
        let extracted = iut.extractData(
            fromPKPush: TestPKPushPayload(
                type: PKPushType.voIP,
                dictionaryPayload: ["sudoplatform": ["servicename": client1.serviceName, "data": data]]))

        XCTAssertEqual(extracted, SudoNotificationData(serviceName: client1.serviceName, data: data))
    }

    // MARK: - extractData fromNotificationContent

    func testExtractDataFromNotificationContentShouldReturnNilIfUnrecognizedDictionaryType() throws {
        let iut = try DefaultSudoNotifiableClient(notifiableClients: [client1, client2])

        let content = UNMutableNotificationContent()
        content.userInfo = [1: 2, "sudoplatform": ["servicename": client1.serviceName]]

        let extracted = iut.extractData(fromNotificationContent: content)

        XCTAssertNil(extracted)
    }

    func testExtractDataFromNotificationContentShouldReturnNilIfMissingSudoplatformKey() throws {
        let iut = try DefaultSudoNotifiableClient(notifiableClients: [client1, client2])

        let content = UNMutableNotificationContent()
        content.userInfo = ["not-sudoplatform": "something"]

        let extracted = iut.extractData(fromNotificationContent: content)

        XCTAssertNil(extracted)
    }

    func testExtractDataFromNotificationContentShouldReturnNilIfSudoplatformKeyHasNoServicename() throws {
        let iut = try DefaultSudoNotifiableClient(notifiableClients: [client1, client2])

        let content = UNMutableNotificationContent()
        content.userInfo = ["sudoplatform": ["data": "somedata"]]

        let extracted = iut.extractData(fromNotificationContent: content)

        XCTAssertNil(extracted)
    }

    func testExtractDataFromNotificationContentShouldReturnDataWithNilDataIfSudoplatformKeyHasNoData() throws {
        let iut = try DefaultSudoNotifiableClient(notifiableClients: [client1, client2])

        let content = UNMutableNotificationContent()
        content.userInfo = ["sudoplatform": ["servicename": client1.serviceName]]

        let extracted = iut.extractData(fromNotificationContent: content)

        XCTAssertEqual(extracted, SudoNotificationData(serviceName: client1.serviceName, data: nil))
    }

    func testExtractDataFromNotificationContentShouldReturnData() throws {
        let iut = try DefaultSudoNotifiableClient(notifiableClients: [client1, client2])

        let data = "some-data"
        let content = UNMutableNotificationContent()
        content.userInfo = ["sudoplatform": ["servicename": client1.serviceName, "data": data]]

        let extracted = iut.extractData(fromNotificationContent: content)

        XCTAssertEqual(extracted, SudoNotificationData(serviceName: client1.serviceName, data: data))
    }

    // MARK: - decodeData

    func testDecodeDataShlouldReturnNilIfNoMatchingNotifiableClientIsRegistered() throws {
        let iut = try DefaultSudoNotifiableClient(notifiableClients: [client1])

        let decoded = iut.decodeData(data: SudoNotificationData(serviceName: client2.serviceName, data: "some-data"))

        XCTAssertNil(decoded)
    }

    func testDecodeDataShlouldReturnNilIfDataIsNil() throws {
        let iut = try DefaultSudoNotifiableClient(notifiableClients: [client1])

        let decoded = iut.decodeData(data: SudoNotificationData(serviceName: client1.serviceName, data: nil))

        XCTAssertNil(decoded)
    }

    func testDecodeDataShouldDecodeUsingTheCorrectClient() throws {
        let iut = try DefaultSudoNotifiableClient(notifiableClients: [client1, client2])

        let data = """
        {
          "type":"client-notification",
          "f1":"f1-value"
        }
        """

        var decoded = iut.decodeData(data: SudoNotificationData(serviceName: client1.serviceName, data: data))
        guard let safeDecoded = decoded as? TestSudoNotification else {
            return XCTFail("Decoded notification not of expected type: \(String(describing: decoded))")
        }
        var expected = TestSudoNotification(
            serviceName: client1.serviceName,
            type: "client-notification",
            f1: "f1-value",
            f2: nil)
        XCTAssertEqual(expected, safeDecoded)

        decoded = iut.decodeData(data: SudoNotificationData(serviceName: client2.serviceName, data: data))
        guard let safeDecoded = decoded as? TestSudoNotification else {
            return XCTFail("Decoded notification not of expected type: \(String(describing: decoded))")
        }
        expected = TestSudoNotification(
            serviceName: client2.serviceName,
            type: "client-notification",
            f1: "f1-value",
            f2: nil)
        XCTAssertEqual(expected, safeDecoded)
    }
}
