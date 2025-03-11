//
// Copyright © 2022 Anonyome Labs, Inc. All rights reserved.
//
// SPDX-License-Identifier: Apache-2.0
//  

import Amplify
import Foundation
import SudoApiClient

/// Errors that occur in SudoNotification.
public enum SudoNotificationError: Error, Equatable, LocalizedError {
    public static func == (lhs: SudoNotificationError, rhs: SudoNotificationError) -> Bool {
        switch (lhs, rhs) {
        case (.requestFailed(let lhsResponse, let lhsCause), requestFailed(let rhsResponse, let rhsCause)):
            if let lhsResponse = lhsResponse, let rhsResponse = rhsResponse {
                return lhsResponse.statusCode == rhsResponse.statusCode
            }
            return type(of: lhsCause) == type(of: rhsCause)
        case
            (.invalidConfig, .invalidConfig),
            (.notSignedIn, .notSignedIn),
            (.accountLocked, .accountLocked),
            (.alreadyRegistered, .alreadyRegistered),
            (.notFound, .notFound),
            (.updateError, .updateError),
            (.deleteError, .deleteError),
            (.createError, .createError),
            (.readError, .readError),
            (.notAuthorized, .notAuthorized),
            (.notificationServiceConfigNotFound, .notificationServiceConfigNotFound),
            (.serviceError, .serviceError),
            (.graphQLError, .graphQLError),
            (.fatalError, .fatalError),
            (.invalidArgument, .invalidArgument),
            (.invalidNotification, .invalidNotification),
            (.invalidRequest, .invalidRequest):
            return true
        default:
            return false
        }
    }

    // MARK: - Client

    /// Configuration supplied to `DefaultSudoNotificationClient` is invalid.
    case invalidConfig

    /// User is not signed in.
    case notSignedIn

    /// The configuration related to Notification Service is not found in the provided configuration file
    /// This may indicate that the Notification Service is not deployed into your runtime instance or the
    /// configuration file that you are using is invalid..
    case notificationServiceConfigNotFound

    /// Indicates the requested operation failed because the user account is locked.
    case accountLocked

    /// Already registered for push notification, should call update registration
    case alreadyRegistered

    /// Device not found
    case notFound

    /// Device update error
    case updateError

    /// Device delete error
    case deleteError

    /// Device create error
    case createError

    /// Device read error
    case readError

    /// Indicates that the request operation failed due to authorization error. This maybe due to the authentication
    /// token being invalid or other security controls that prevent the user from accessing the API.
    case notAuthorized

    /// Indicates that an internal server error caused the operation to fail. The error is possibly transient and
    /// retrying at a later time may cause the operation to complete successfully
    case serviceError

    /// Indicates that the request failed due to connectivity, availability or access error.
    case requestFailed(response: HTTPURLResponse?, cause: Error?)

    /// Indicates that an unexpected GraphQL error was returned by the service.
    case graphQLError(cause: GraphQLError)

    /// Indicates that a fatal error occurred. This could be due to coding error, out-of-memory condition or other
    /// conditions that is beyond control of `SudoSecureVaultClient` implementation.
    case fatalError(_ description: String)

    case invalidNotification
    case invalidArgument
    case invalidRequest

    /// Indicates that a service error was returned.
    case errorCode(code: Int)

    // MARK: - Lifecycle

    /// Initialize a `SudoNotificationError` from a `GraphQLError`.
    ///
    /// If the GraphQLError is unsupported, `nil` will be returned instead.
    init(graphQLError error: GraphQLError) {
        guard let errorType = error.extensions?["errorType"]?.stringValue else {
            self = .graphQLError(cause: error)
            return
        }
        switch errorType {
        case "sudoplatform.ns.DeviceExist":
            self = .alreadyRegistered
        case "sudoplatform.ns.DeviceNotFound":
            self = .notFound
        case "sudoplatform.ns.DeviceCreate":
            self = .createError
        case "sudoplatform.ns.DeviceUpdate":
            self = .updateError
        case "sudoplatform.ns.DeviceDelete":
            self = .deleteError
        case "sudoplatform.ns.DeviceRead":
            self = .readError
        default:
            self = .graphQLError(cause: error)
        }
    }

    /// Initialize a `SudoNotificationError` from error code.
    init(errorCode error: Int) {
        self = .errorCode(code: error)
        return
    }

    static func fromApiOperationError(error: Error) -> SudoNotificationError {
        if let notificationError = error as? SudoNotificationError {
            return notificationError
        }
        // Check if ApiOperationError
        guard let apiOperationError = error as? ApiOperationError else {
            return .fatalError("Unexpected error: \(error)")
        }

        switch apiOperationError {
        case .accountLocked:
            return .accountLocked
        case .notSignedIn:
            return .notSignedIn
        case .notAuthorized:
            return .notAuthorized
        case .invalidArgument:
            return .invalidArgument
        case .invalidRequest:
            return .invalidRequest
        case .serviceError:
            return .serviceError
        case .graphQLError(let underlyingError):
            guard let graphQLError = underlyingError as? GraphQLError else {
                return .fatalError("Unexpected API operation error: \(error)")
            }
            return SudoNotificationError(graphQLError: graphQLError)
        case .requestFailed(let response, let cause):
            return .requestFailed(response: response, cause: cause)
        case .fatalError(let description):
            return .fatalError(description)
        default:
            return .fatalError("Unexpected API operation error: \(error)")
        }
    }

    public var errorDescription: String? {
        switch self {
        case .alreadyRegistered:
            return NSLocalizedString("Device already registered for notification", comment: "already registered")
        case .notFound:
            return NSLocalizedString("Device not found", comment: "not found")
        case .createError:
            return NSLocalizedString("Device creation error", comment: "create")
        case .updateError:
            return NSLocalizedString("Device update error", comment: "update")
        case .deleteError:
            return NSLocalizedString("Device delete error", comment: "delete")
        case .readError:
            return NSLocalizedString("Device read error", comment: "read")
        case .invalidConfig:
            return NSLocalizedString("Invalid platform configuration file", comment: "invalid config")
        case .notSignedIn:
            return NSLocalizedString("User not signed in", comment: "not signed in")
        case .notificationServiceConfigNotFound:
            return NSLocalizedString("Missing notification service configuration", comment: "missing notification config")
        case .accountLocked:
            return NSLocalizedString("User account locked", comment: "account locked")
        case .invalidNotification:
            return NSLocalizedString("Invalid notification payload", comment: "notification payload")
        default:
            return NSLocalizedString("Notification service error", comment: "generic error")
        }
    }
}
