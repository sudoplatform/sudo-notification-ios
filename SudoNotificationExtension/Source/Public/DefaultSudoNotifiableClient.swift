//
// Copyright © 2024 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import UserNotifications
import PushKit
import SudoLogging

/// Client used to decode notification payload data specific to Sudo Platform services used by an application
///
/// This client is light weight and suitable for use within a Notification Extension
public class DefaultSudoNotifiableClient {
    // MARK: - Properties

    private var notifiableClients: [String: any SudoNotifiableClient]
    private let logger: Logger

    // MARK: - Lifecycle

    /// Construct a new instance
    ///
    ///  - Parameters:
    ///    - notifiableClients:
    ///         Array of SudoNotifiableClient implementations. Provide one for each Sudo Platform
    ///         notification emitting service consumed by your
    ///  - Returns: Constructed
    ///  - Throws: `SudoNotifiableClientError.duplicateNotifiableClient` if more than one SudoNotifiableClient
    ///    is provided for a particular Sudo Platform service.
    ///
    public convenience init(notifiableClients: [any SudoNotifiableClient]) throws {
        try self.init(notifiableClients: notifiableClients, logger: .notifiableClientLogger)
    }

    init(notifiableClients: [any SudoNotifiableClient], logger: Logger) throws {
        self.notifiableClients = [:]
        self.logger = logger

        try notifiableClients.forEach { notifiableClient in
            if self.notifiableClients[notifiableClient.serviceName] != nil {
                throw SudoNotifiableClientError.duplicateNotifiableClient(notifiableClient.serviceName)
            }

            logger.debug("Adding notifiable client for \(notifiableClient.serviceName)")
            self.notifiableClients[notifiableClient.serviceName] = notifiableClient
        }
    }

    // MARK: Public methods

    ///
    /// Extract encoded Sudo Platform notification specific data from a PushKit notification payload
    /// if it is present.
    ///
    ///  - Parameters:
    ///     - fromPKPush: `PKPushPayload` to extract data from
    ///
    ///  - Returns: If the notification payload contains Sudo Platform notification specific data, a
    ///    `SudoNotificationData` is returned that should then be passed to `decodeData`. If no Sudo Platform
    ///    notification specific data is present, then nil is returned.
    ///
    public func extractData(fromPKPush payload: PKPushPayload) -> SudoNotificationData? {
        if payload.type != .voIP {
            logger.debug("Not handling \(payload.type) PKPush notification")
            return nil
        }

        guard let dictionaryPayload = payload.dictionaryPayload as? [String: Any] else {
            logger.debug("Not handling notification without a [String:Any] dictionaryPayload")
            return nil
        }

        return extractData(fromDictionary: dictionaryPayload)
    }

    ///
    /// Extract encoded Sudo Platform notification specific data from a Notification Center notification payload
    /// if it is present.
    ///
    ///  - Parameters:
    ///     - fromNotificationContent: `UNNotificationContent` to extract data from
    ///
    ///  - Returns: If the notification payload contains Sudo Platform notification specific data, a
    ///    `SudoNotificationData` is returned that should then be passed to `decodeData`. If no Sudo Platform
    ///    notification specific data is present, then nil is returned.
    ///
    public func extractData(fromNotificationContent payload: UNNotificationContent) -> SudoNotificationData? {

        guard let dictionaryPayload = payload.userInfo as? [String: Any] else {
            logger.debug("Not handling notification without a [String:Any] userInfo")
            return nil
        }

        return extractData(fromDictionary: dictionaryPayload)
    }

    ///
    /// Decode Sudo Notification specific data to a service specific instance of a SudoNotification
    ///
    /// - Parameters:
    ///   - data: `SudoNotificationData` to decode
    /// - Returns: Service specific implementation of `SudoNotification` or nil if `data` contains no data to decode
    ///
    public func decodeData(data: SudoNotificationData) -> (any SudoNotification)? {
        guard let notifiableClient = notifiableClients[data.serviceName] else {
            logger.debug("No registered notifiable client for service \(data.serviceName) notification")
            return nil
        }

        guard let dataToDecode = data.data else {
            logger.debug("No data to decode for \(data.serviceName) notification")
            return nil
        }

        logger.debug("Decoding notification for service \(data.serviceName)")
        return notifiableClient.decode(data: dataToDecode)
    }

    // MARK: - Private methods

    private func extractData(fromDictionary payload: [String: Any]) -> SudoNotificationData? {
        guard let sudoplatform = payload["sudoplatform"] as? [String: AnyObject] else {
            logger.debug("Not handling notification without a [String:AnyObject] sudoplatform entry")
            return nil
        }

        guard let serviceName = sudoplatform["servicename"] as? String else {
            logger.debug("Not handling notification without String sudoplatform[servicename]")
            return nil
        }

        let anyData = sudoplatform["data"]
        let data: String?
        if anyData == nil {
            data = nil
        } else {
            guard let stringData = anyData as? String else {
                logger.debug("Not handling notification without String sudoplatform[data]")
                return nil
            }
            data = stringData
        }

        return SudoNotificationData(serviceName: serviceName, data: data)
    }
}
