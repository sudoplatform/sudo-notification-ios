// swiftlint:disable all
//  This file was automatically generated and should not be edited.

import Amplify
import SudoApiClient

struct GraphQL {

internal struct DeleteAppFromDeviceInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(bundleId: String, deviceId: String) {
    graphQLMap = ["bundleId": bundleId, "deviceId": deviceId]
  }

  internal var bundleId: String {
    get {
      return graphQLMap["bundleId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bundleId")
    }
  }

  internal var deviceId: String {
    get {
      return graphQLMap["deviceId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "deviceId")
    }
  }
}

internal struct GetSettingsInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(bundleId: String, deviceId: String) {
    graphQLMap = ["bundleId": bundleId, "deviceId": deviceId]
  }

  internal var bundleId: String {
    get {
      return graphQLMap["bundleId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bundleId")
    }
  }

  internal var deviceId: String {
    get {
      return graphQLMap["deviceId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "deviceId")
    }
  }
}

internal struct GetUserAndDeviceSettingsInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(bundleId: String, deviceId: Optional<String?> = nil) {
    graphQLMap = ["bundleId": bundleId, "deviceId": deviceId]
  }

  internal var bundleId: String {
    get {
      return graphQLMap["bundleId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bundleId")
    }
  }

  internal var deviceId: Optional<String?> {
    get {
      return graphQLMap["deviceId"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "deviceId")
    }
  }
}

internal enum FilterAction: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case disable
  case enable
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "DISABLE": self = .disable
      case "ENABLE": self = .enable
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .disable: return "DISABLE"
      case .enable: return "ENABLE"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: FilterAction, rhs: FilterAction) -> Bool {
    switch (lhs, rhs) {
      case (.disable, .disable): return true
      case (.enable, .enable): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal struct RegisterAppOnDeviceInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(build: buildType, bundleId: String, clientEnv: clientEnvType, deviceId: String, locale: Optional<String?> = nil, standardToken: Optional<String?> = nil, version: Optional<String?> = nil, voipToken: Optional<String?> = nil) {
    graphQLMap = ["build": build, "bundleId": bundleId, "clientEnv": clientEnv, "deviceId": deviceId, "locale": locale, "standardToken": standardToken, "version": version, "voipToken": voipToken]
  }

  internal var build: buildType {
    get {
      return graphQLMap["build"] as! buildType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "build")
    }
  }

  internal var bundleId: String {
    get {
      return graphQLMap["bundleId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bundleId")
    }
  }

  internal var clientEnv: clientEnvType {
    get {
      return graphQLMap["clientEnv"] as! clientEnvType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "clientEnv")
    }
  }

  internal var deviceId: String {
    get {
      return graphQLMap["deviceId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "deviceId")
    }
  }

  internal var locale: Optional<String?> {
    get {
      return graphQLMap["locale"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "locale")
    }
  }

  internal var standardToken: Optional<String?> {
    get {
      return graphQLMap["standardToken"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "standardToken")
    }
  }

  internal var version: Optional<String?> {
    get {
      return graphQLMap["version"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "version")
    }
  }

  internal var voipToken: Optional<String?> {
    get {
      return graphQLMap["voipToken"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "voipToken")
    }
  }
}

internal enum buildType: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case debug
  case release
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "DEBUG": self = .debug
      case "RELEASE": self = .release
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .debug: return "DEBUG"
      case .release: return "RELEASE"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: buildType, rhs: buildType) -> Bool {
    switch (lhs, rhs) {
      case (.debug, .debug): return true
      case (.release, .release): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal enum clientEnvType: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case android
  case ios
  case test
  case web
  case webhook
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "ANDROID": self = .android
      case "IOS": self = .ios
      case "TEST": self = .test
      case "WEB": self = .web
      case "WEBHOOK": self = .webhook
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .android: return "ANDROID"
      case .ios: return "IOS"
      case .test: return "TEST"
      case .web: return "WEB"
      case .webhook: return "WEBHOOK"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: clientEnvType, rhs: clientEnvType) -> Bool {
    switch (lhs, rhs) {
      case (.android, .android): return true
      case (.ios, .ios): return true
      case (.test, .test): return true
      case (.web, .web): return true
      case (.webhook, .webhook): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal struct SendTestNotificationInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(body: Optional<String?> = nil, data: String, filter: String, purpose: Optional<TestNotificationPurpose?> = nil, serviceName: String, title: Optional<String?> = nil) {
    graphQLMap = ["body": body, "data": data, "filter": filter, "purpose": purpose, "serviceName": serviceName, "title": title]
  }

  internal var body: Optional<String?> {
    get {
      return graphQLMap["body"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "body")
    }
  }

  internal var data: String {
    get {
      return graphQLMap["data"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "data")
    }
  }

  internal var filter: String {
    get {
      return graphQLMap["filter"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "filter")
    }
  }

  internal var purpose: Optional<TestNotificationPurpose?> {
    get {
      return graphQLMap["purpose"] as! Optional<TestNotificationPurpose?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "purpose")
    }
  }

  internal var serviceName: String {
    get {
      return graphQLMap["serviceName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "serviceName")
    }
  }

  internal var title: Optional<String?> {
    get {
      return graphQLMap["title"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }
}

internal enum TestNotificationPurpose: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case standard
  case voip
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "STANDARD": self = .standard
      case "VOIP": self = .voip
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .standard: return "STANDARD"
      case .voip: return "VOIP"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: TestNotificationPurpose, rhs: TestNotificationPurpose) -> Bool {
    switch (lhs, rhs) {
      case (.standard, .standard): return true
      case (.voip, .voip): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal struct UpdateInfoInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(build: buildType, bundleId: String, deviceId: String, locale: Optional<String?> = nil, standardToken: Optional<String?> = nil, version: Optional<String?> = nil, voipToken: Optional<String?> = nil) {
    graphQLMap = ["build": build, "bundleId": bundleId, "deviceId": deviceId, "locale": locale, "standardToken": standardToken, "version": version, "voipToken": voipToken]
  }

  internal var build: buildType {
    get {
      return graphQLMap["build"] as! buildType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "build")
    }
  }

  internal var bundleId: String {
    get {
      return graphQLMap["bundleId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bundleId")
    }
  }

  internal var deviceId: String {
    get {
      return graphQLMap["deviceId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "deviceId")
    }
  }

  internal var locale: Optional<String?> {
    get {
      return graphQLMap["locale"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "locale")
    }
  }

  internal var standardToken: Optional<String?> {
    get {
      return graphQLMap["standardToken"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "standardToken")
    }
  }

  internal var version: Optional<String?> {
    get {
      return graphQLMap["version"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "version")
    }
  }

  internal var voipToken: Optional<String?> {
    get {
      return graphQLMap["voipToken"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "voipToken")
    }
  }
}

internal struct UpdateSettingsInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(bundleId: String, deviceId: Optional<String?> = nil, filter: [Filter?], services: [NotifiableServiceSchema]) {
    graphQLMap = ["bundleId": bundleId, "deviceId": deviceId, "filter": filter, "services": services]
  }

  internal var bundleId: String {
    get {
      return graphQLMap["bundleId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bundleId")
    }
  }

  internal var deviceId: Optional<String?> {
    get {
      return graphQLMap["deviceId"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "deviceId")
    }
  }

  internal var filter: [Filter?] {
    get {
      return graphQLMap["filter"] as! [Filter?]
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "filter")
    }
  }

  internal var services: [NotifiableServiceSchema] {
    get {
      return graphQLMap["services"] as! [NotifiableServiceSchema]
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "services")
    }
  }
}

internal struct Filter: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(actionType: FilterAction, enableMeta: Optional<String?> = nil, rule: String, serviceName: String) {
    graphQLMap = ["actionType": actionType, "enableMeta": enableMeta, "rule": rule, "serviceName": serviceName]
  }

  internal var actionType: FilterAction {
    get {
      return graphQLMap["actionType"] as! FilterAction
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "actionType")
    }
  }

  internal var enableMeta: Optional<String?> {
    get {
      return graphQLMap["enableMeta"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "enableMeta")
    }
  }

  internal var rule: String {
    get {
      return graphQLMap["rule"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "rule")
    }
  }

  internal var serviceName: String {
    get {
      return graphQLMap["serviceName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "serviceName")
    }
  }
}

internal struct NotifiableServiceSchema: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(schema: Optional<[SchemaEntry]?> = nil, serviceName: String) {
    graphQLMap = ["schema": schema, "serviceName": serviceName]
  }

  internal var schema: Optional<[SchemaEntry]?> {
    get {
      return graphQLMap["schema"] as! Optional<[SchemaEntry]?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "schema")
    }
  }

  internal var serviceName: String {
    get {
      return graphQLMap["serviceName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "serviceName")
    }
  }
}

internal struct SchemaEntry: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(description: String, fieldName: String, type: String) {
    graphQLMap = ["description": description, "fieldName": fieldName, "type": type]
  }

  internal var description: String {
    get {
      return graphQLMap["description"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  internal var fieldName: String {
    get {
      return graphQLMap["fieldName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fieldName")
    }
  }

  internal var type: String {
    get {
      return graphQLMap["type"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }
}

internal final class DeleteAppFromDeviceMutation: GraphQLMutation {
  internal static let operationString =
    "mutation DeleteAppFromDevice($input: DeleteAppFromDeviceInput!) {\n  deleteAppFromDevice(input: $input)\n}"

  internal var input: DeleteAppFromDeviceInput

  internal init(input: DeleteAppFromDeviceInput) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("deleteAppFromDevice", arguments: ["input": GraphQLVariable("input")], type: .scalar(Bool.self)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(deleteAppFromDevice: Bool? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteAppFromDevice": deleteAppFromDevice])
    }

    internal var deleteAppFromDevice: Bool? {
      get {
        return snapshot["deleteAppFromDevice"] as? Bool
      }
      set {
        snapshot.updateValue(newValue, forKey: "deleteAppFromDevice")
      }
    }
  }
}

internal final class GetNotificationSettingsQuery: GraphQLQuery {
  internal static let operationString =
    "query getNotificationSettings($input: GetSettingsInput!) {\n  getNotificationSettings(input: $input) {\n    __typename\n    ...NotificationSettingsOutput\n  }\n}"

  internal static var requestString: String { return operationString.appending(NotificationSettingsOutput.fragmentString) }

  internal var input: GetSettingsInput

  internal init(input: GetSettingsInput) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("getNotificationSettings", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(GetNotificationSetting.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(getNotificationSettings: GetNotificationSetting) {
      self.init(snapshot: ["__typename": "Query", "getNotificationSettings": getNotificationSettings.snapshot])
    }

    internal var getNotificationSettings: GetNotificationSetting {
      get {
        return GetNotificationSetting(snapshot: snapshot["getNotificationSettings"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "getNotificationSettings")
      }
    }

    internal struct GetNotificationSetting: GraphQLSelectionSet {
      internal static let possibleTypes = ["NotificationSettingsOutput"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("filter", type: .nonNull(.list(.nonNull(.object(Filter.selections))))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(filter: [Filter]) {
        self.init(snapshot: ["__typename": "NotificationSettingsOutput", "filter": filter.map { $0.snapshot }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var filter: [Filter] {
        get {
          return (snapshot["filter"] as! [Snapshot]).map { Filter(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "filter")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var notificationSettingsOutput: NotificationSettingsOutput {
          get {
            return NotificationSettingsOutput(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      internal struct Filter: GraphQLSelectionSet {
        internal static let possibleTypes = ["FilterOutputEntry"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("serviceName", type: .nonNull(.scalar(String.self))),
          GraphQLField("actionType", type: .nonNull(.scalar(FilterAction.self))),
          GraphQLField("rule", type: .nonNull(.scalar(String.self))),
          GraphQLField("enableMeta", type: .scalar(String.self)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(serviceName: String, actionType: FilterAction, rule: String, enableMeta: String? = nil) {
          self.init(snapshot: ["__typename": "FilterOutputEntry", "serviceName": serviceName, "actionType": actionType, "rule": rule, "enableMeta": enableMeta])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var serviceName: String {
          get {
            return snapshot["serviceName"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "serviceName")
          }
        }

        internal var actionType: FilterAction {
          get {
            return snapshot["actionType"]! as! FilterAction
          }
          set {
            snapshot.updateValue(newValue, forKey: "actionType")
          }
        }

        internal var rule: String {
          get {
            return snapshot["rule"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "rule")
          }
        }

        internal var enableMeta: String? {
          get {
            return snapshot["enableMeta"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "enableMeta")
          }
        }
      }
    }
  }
}

internal final class GetUserAndDeviceNotificationSettingsQuery: GraphQLQuery {
  internal static let operationString =
    "query getUserAndDeviceNotificationSettings($input: GetUserAndDeviceSettingsInput!) {\n  getUserAndDeviceNotificationSettings(input: $input) {\n    __typename\n    ...UserAndDeviceNotificationSettingsOutput\n  }\n}"

  internal static var requestString: String { return operationString.appending(UserAndDeviceNotificationSettingsOutput.fragmentString).appending(NotificationSettingsOutput.fragmentString) }

  internal var input: GetUserAndDeviceSettingsInput

  internal init(input: GetUserAndDeviceSettingsInput) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("getUserAndDeviceNotificationSettings", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(GetUserAndDeviceNotificationSetting.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(getUserAndDeviceNotificationSettings: GetUserAndDeviceNotificationSetting) {
      self.init(snapshot: ["__typename": "Query", "getUserAndDeviceNotificationSettings": getUserAndDeviceNotificationSettings.snapshot])
    }

    internal var getUserAndDeviceNotificationSettings: GetUserAndDeviceNotificationSetting {
      get {
        return GetUserAndDeviceNotificationSetting(snapshot: snapshot["getUserAndDeviceNotificationSettings"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "getUserAndDeviceNotificationSettings")
      }
    }

    internal struct GetUserAndDeviceNotificationSetting: GraphQLSelectionSet {
      internal static let possibleTypes = ["UserAndDeviceNotificationSettingsOutput"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("user", type: .object(User.selections)),
        GraphQLField("device", type: .object(Device.selections)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(user: User? = nil, device: Device? = nil) {
        self.init(snapshot: ["__typename": "UserAndDeviceNotificationSettingsOutput", "user": user.flatMap { $0.snapshot }, "device": device.flatMap { $0.snapshot }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var user: User? {
        get {
          return (snapshot["user"] as? Snapshot).flatMap { User(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "user")
        }
      }

      internal var device: Device? {
        get {
          return (snapshot["device"] as? Snapshot).flatMap { Device(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "device")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var userAndDeviceNotificationSettingsOutput: UserAndDeviceNotificationSettingsOutput {
          get {
            return UserAndDeviceNotificationSettingsOutput(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      internal struct User: GraphQLSelectionSet {
        internal static let possibleTypes = ["NotificationSettingsOutput"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("filter", type: .nonNull(.list(.nonNull(.object(Filter.selections))))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(filter: [Filter]) {
          self.init(snapshot: ["__typename": "NotificationSettingsOutput", "filter": filter.map { $0.snapshot }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var filter: [Filter] {
          get {
            return (snapshot["filter"] as! [Snapshot]).map { Filter(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "filter")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var notificationSettingsOutput: NotificationSettingsOutput {
            get {
              return NotificationSettingsOutput(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct Filter: GraphQLSelectionSet {
          internal static let possibleTypes = ["FilterOutputEntry"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("serviceName", type: .nonNull(.scalar(String.self))),
            GraphQLField("actionType", type: .nonNull(.scalar(FilterAction.self))),
            GraphQLField("rule", type: .nonNull(.scalar(String.self))),
            GraphQLField("enableMeta", type: .scalar(String.self)),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(serviceName: String, actionType: FilterAction, rule: String, enableMeta: String? = nil) {
            self.init(snapshot: ["__typename": "FilterOutputEntry", "serviceName": serviceName, "actionType": actionType, "rule": rule, "enableMeta": enableMeta])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var serviceName: String {
            get {
              return snapshot["serviceName"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "serviceName")
            }
          }

          internal var actionType: FilterAction {
            get {
              return snapshot["actionType"]! as! FilterAction
            }
            set {
              snapshot.updateValue(newValue, forKey: "actionType")
            }
          }

          internal var rule: String {
            get {
              return snapshot["rule"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "rule")
            }
          }

          internal var enableMeta: String? {
            get {
              return snapshot["enableMeta"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "enableMeta")
            }
          }
        }
      }

      internal struct Device: GraphQLSelectionSet {
        internal static let possibleTypes = ["NotificationSettingsOutput"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("filter", type: .nonNull(.list(.nonNull(.object(Filter.selections))))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(filter: [Filter]) {
          self.init(snapshot: ["__typename": "NotificationSettingsOutput", "filter": filter.map { $0.snapshot }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var filter: [Filter] {
          get {
            return (snapshot["filter"] as! [Snapshot]).map { Filter(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "filter")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var notificationSettingsOutput: NotificationSettingsOutput {
            get {
              return NotificationSettingsOutput(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct Filter: GraphQLSelectionSet {
          internal static let possibleTypes = ["FilterOutputEntry"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("serviceName", type: .nonNull(.scalar(String.self))),
            GraphQLField("actionType", type: .nonNull(.scalar(FilterAction.self))),
            GraphQLField("rule", type: .nonNull(.scalar(String.self))),
            GraphQLField("enableMeta", type: .scalar(String.self)),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(serviceName: String, actionType: FilterAction, rule: String, enableMeta: String? = nil) {
            self.init(snapshot: ["__typename": "FilterOutputEntry", "serviceName": serviceName, "actionType": actionType, "rule": rule, "enableMeta": enableMeta])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var serviceName: String {
            get {
              return snapshot["serviceName"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "serviceName")
            }
          }

          internal var actionType: FilterAction {
            get {
              return snapshot["actionType"]! as! FilterAction
            }
            set {
              snapshot.updateValue(newValue, forKey: "actionType")
            }
          }

          internal var rule: String {
            get {
              return snapshot["rule"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "rule")
            }
          }

          internal var enableMeta: String? {
            get {
              return snapshot["enableMeta"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "enableMeta")
            }
          }
        }
      }
    }
  }
}

internal final class GetUserNotificationSettingsQuery: GraphQLQuery {
  internal static let operationString =
    "query getUserNotificationSettings($input: String!) {\n  getUserAndDeviceNotificationSettings(input: {bundleId: $input}) {\n    __typename\n    ...UserAndDeviceNotificationSettingsOutput\n  }\n}"

  internal static var requestString: String { return operationString.appending(UserAndDeviceNotificationSettingsOutput.fragmentString).appending(NotificationSettingsOutput.fragmentString) }

  internal var input: String

  internal init(input: String) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("getUserAndDeviceNotificationSettings", arguments: ["input": ["bundleId": GraphQLVariable("input")]], type: .nonNull(.object(GetUserAndDeviceNotificationSetting.selections))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(getUserAndDeviceNotificationSettings: GetUserAndDeviceNotificationSetting) {
      self.init(snapshot: ["__typename": "Query", "getUserAndDeviceNotificationSettings": getUserAndDeviceNotificationSettings.snapshot])
    }

    internal var getUserAndDeviceNotificationSettings: GetUserAndDeviceNotificationSetting {
      get {
        return GetUserAndDeviceNotificationSetting(snapshot: snapshot["getUserAndDeviceNotificationSettings"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "getUserAndDeviceNotificationSettings")
      }
    }

    internal struct GetUserAndDeviceNotificationSetting: GraphQLSelectionSet {
      internal static let possibleTypes = ["UserAndDeviceNotificationSettingsOutput"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("user", type: .object(User.selections)),
        GraphQLField("device", type: .object(Device.selections)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(user: User? = nil, device: Device? = nil) {
        self.init(snapshot: ["__typename": "UserAndDeviceNotificationSettingsOutput", "user": user.flatMap { $0.snapshot }, "device": device.flatMap { $0.snapshot }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var user: User? {
        get {
          return (snapshot["user"] as? Snapshot).flatMap { User(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "user")
        }
      }

      internal var device: Device? {
        get {
          return (snapshot["device"] as? Snapshot).flatMap { Device(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "device")
        }
      }

      internal var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      internal struct Fragments {
        internal var snapshot: Snapshot

        internal var userAndDeviceNotificationSettingsOutput: UserAndDeviceNotificationSettingsOutput {
          get {
            return UserAndDeviceNotificationSettingsOutput(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      internal struct User: GraphQLSelectionSet {
        internal static let possibleTypes = ["NotificationSettingsOutput"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("filter", type: .nonNull(.list(.nonNull(.object(Filter.selections))))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(filter: [Filter]) {
          self.init(snapshot: ["__typename": "NotificationSettingsOutput", "filter": filter.map { $0.snapshot }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var filter: [Filter] {
          get {
            return (snapshot["filter"] as! [Snapshot]).map { Filter(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "filter")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var notificationSettingsOutput: NotificationSettingsOutput {
            get {
              return NotificationSettingsOutput(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct Filter: GraphQLSelectionSet {
          internal static let possibleTypes = ["FilterOutputEntry"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("serviceName", type: .nonNull(.scalar(String.self))),
            GraphQLField("actionType", type: .nonNull(.scalar(FilterAction.self))),
            GraphQLField("rule", type: .nonNull(.scalar(String.self))),
            GraphQLField("enableMeta", type: .scalar(String.self)),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(serviceName: String, actionType: FilterAction, rule: String, enableMeta: String? = nil) {
            self.init(snapshot: ["__typename": "FilterOutputEntry", "serviceName": serviceName, "actionType": actionType, "rule": rule, "enableMeta": enableMeta])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var serviceName: String {
            get {
              return snapshot["serviceName"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "serviceName")
            }
          }

          internal var actionType: FilterAction {
            get {
              return snapshot["actionType"]! as! FilterAction
            }
            set {
              snapshot.updateValue(newValue, forKey: "actionType")
            }
          }

          internal var rule: String {
            get {
              return snapshot["rule"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "rule")
            }
          }

          internal var enableMeta: String? {
            get {
              return snapshot["enableMeta"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "enableMeta")
            }
          }
        }
      }

      internal struct Device: GraphQLSelectionSet {
        internal static let possibleTypes = ["NotificationSettingsOutput"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("filter", type: .nonNull(.list(.nonNull(.object(Filter.selections))))),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(filter: [Filter]) {
          self.init(snapshot: ["__typename": "NotificationSettingsOutput", "filter": filter.map { $0.snapshot }])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var filter: [Filter] {
          get {
            return (snapshot["filter"] as! [Snapshot]).map { Filter(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "filter")
          }
        }

        internal var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        internal struct Fragments {
          internal var snapshot: Snapshot

          internal var notificationSettingsOutput: NotificationSettingsOutput {
            get {
              return NotificationSettingsOutput(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        internal struct Filter: GraphQLSelectionSet {
          internal static let possibleTypes = ["FilterOutputEntry"]

          internal static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("serviceName", type: .nonNull(.scalar(String.self))),
            GraphQLField("actionType", type: .nonNull(.scalar(FilterAction.self))),
            GraphQLField("rule", type: .nonNull(.scalar(String.self))),
            GraphQLField("enableMeta", type: .scalar(String.self)),
          ]

          internal var snapshot: Snapshot

          internal init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          internal init(serviceName: String, actionType: FilterAction, rule: String, enableMeta: String? = nil) {
            self.init(snapshot: ["__typename": "FilterOutputEntry", "serviceName": serviceName, "actionType": actionType, "rule": rule, "enableMeta": enableMeta])
          }

          internal var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          internal var serviceName: String {
            get {
              return snapshot["serviceName"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "serviceName")
            }
          }

          internal var actionType: FilterAction {
            get {
              return snapshot["actionType"]! as! FilterAction
            }
            set {
              snapshot.updateValue(newValue, forKey: "actionType")
            }
          }

          internal var rule: String {
            get {
              return snapshot["rule"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "rule")
            }
          }

          internal var enableMeta: String? {
            get {
              return snapshot["enableMeta"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "enableMeta")
            }
          }
        }
      }
    }
  }
}

internal final class RegisterAppOnDeviceMutation: GraphQLMutation {
  internal static let operationString =
    "mutation RegisterAppOnDevice($input: RegisterAppOnDeviceInput!) {\n  registerAppOnDevice(input: $input)\n}"

  internal var input: RegisterAppOnDeviceInput

  internal init(input: RegisterAppOnDeviceInput) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("registerAppOnDevice", arguments: ["input": GraphQLVariable("input")], type: .scalar(Bool.self)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(registerAppOnDevice: Bool? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "registerAppOnDevice": registerAppOnDevice])
    }

    internal var registerAppOnDevice: Bool? {
      get {
        return snapshot["registerAppOnDevice"] as? Bool
      }
      set {
        snapshot.updateValue(newValue, forKey: "registerAppOnDevice")
      }
    }
  }
}

internal final class SendTestNotificationMutation: GraphQLMutation {
  internal static let operationString =
    "mutation sendTestNotification($input: SendTestNotificationInput!) {\n  sendTestNotification(input: $input)\n}"

  internal var input: SendTestNotificationInput

  internal init(input: SendTestNotificationInput) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("sendTestNotification", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.scalar(Bool.self))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(sendTestNotification: Bool) {
      self.init(snapshot: ["__typename": "Mutation", "sendTestNotification": sendTestNotification])
    }

    internal var sendTestNotification: Bool {
      get {
        return snapshot["sendTestNotification"]! as! Bool
      }
      set {
        snapshot.updateValue(newValue, forKey: "sendTestNotification")
      }
    }
  }
}

internal final class UpdateDeviceInfoMutation: GraphQLMutation {
  internal static let operationString =
    "mutation updateDeviceInfo($input: UpdateInfoInput!) {\n  updateDeviceInfo(input: $input)\n}"

  internal var input: UpdateInfoInput

  internal init(input: UpdateInfoInput) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("updateDeviceInfo", arguments: ["input": GraphQLVariable("input")], type: .scalar(Bool.self)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(updateDeviceInfo: Bool? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateDeviceInfo": updateDeviceInfo])
    }

    internal var updateDeviceInfo: Bool? {
      get {
        return snapshot["updateDeviceInfo"] as? Bool
      }
      set {
        snapshot.updateValue(newValue, forKey: "updateDeviceInfo")
      }
    }
  }
}

internal final class UpdateNotificationSettingsMutation: GraphQLMutation {
  internal static let operationString =
    "mutation updateNotificationSettings($input: UpdateSettingsInput!) {\n  updateNotificationSettings(input: $input)\n}"

  internal var input: UpdateSettingsInput

  internal init(input: UpdateSettingsInput) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("updateNotificationSettings", arguments: ["input": GraphQLVariable("input")], type: .scalar(Bool.self)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(updateNotificationSettings: Bool? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateNotificationSettings": updateNotificationSettings])
    }

    internal var updateNotificationSettings: Bool? {
      get {
        return snapshot["updateNotificationSettings"] as? Bool
      }
      set {
        snapshot.updateValue(newValue, forKey: "updateNotificationSettings")
      }
    }
  }
}

internal final class UpdateUserNotificationSettingsMutation: GraphQLMutation {
  internal static let operationString =
    "mutation updateUserNotificationSettings($bundleId: String!, $filter: [Filter]!, $services: [NotifiableServiceSchema!]!) {\n  updateNotificationSettings(input: {bundleId: $bundleId, filter: $filter, services: $services})\n}"

  internal var bundleId: String
  internal var filter: [Filter?]
  internal var services: [NotifiableServiceSchema]

  internal init(bundleId: String, filter: [Filter?], services: [NotifiableServiceSchema]) {
    self.bundleId = bundleId
    self.filter = filter
    self.services = services
  }

  internal var variables: GraphQLMap? {
    return ["bundleId": bundleId, "filter": filter, "services": services]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("updateNotificationSettings", arguments: ["input": ["bundleId": GraphQLVariable("bundleId"), "filter": GraphQLVariable("filter"), "services": GraphQLVariable("services")]], type: .scalar(Bool.self)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(updateNotificationSettings: Bool? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateNotificationSettings": updateNotificationSettings])
    }

    internal var updateNotificationSettings: Bool? {
      get {
        return snapshot["updateNotificationSettings"] as? Bool
      }
      set {
        snapshot.updateValue(newValue, forKey: "updateNotificationSettings")
      }
    }
  }
}

internal struct NotificationSettingsOutput: GraphQLFragment {
  internal static let fragmentString =
    "fragment NotificationSettingsOutput on NotificationSettingsOutput {\n  __typename\n  filter {\n    __typename\n    serviceName\n    actionType\n    rule\n    enableMeta\n  }\n}"

  internal static let possibleTypes = ["NotificationSettingsOutput"]

  internal static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("filter", type: .nonNull(.list(.nonNull(.object(Filter.selections))))),
  ]

  internal var snapshot: Snapshot

  internal init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  internal init(filter: [Filter]) {
    self.init(snapshot: ["__typename": "NotificationSettingsOutput", "filter": filter.map { $0.snapshot }])
  }

  internal var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  internal var filter: [Filter] {
    get {
      return (snapshot["filter"] as! [Snapshot]).map { Filter(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "filter")
    }
  }

  internal struct Filter: GraphQLSelectionSet {
    internal static let possibleTypes = ["FilterOutputEntry"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("serviceName", type: .nonNull(.scalar(String.self))),
      GraphQLField("actionType", type: .nonNull(.scalar(FilterAction.self))),
      GraphQLField("rule", type: .nonNull(.scalar(String.self))),
      GraphQLField("enableMeta", type: .scalar(String.self)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(serviceName: String, actionType: FilterAction, rule: String, enableMeta: String? = nil) {
      self.init(snapshot: ["__typename": "FilterOutputEntry", "serviceName": serviceName, "actionType": actionType, "rule": rule, "enableMeta": enableMeta])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    internal var serviceName: String {
      get {
        return snapshot["serviceName"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "serviceName")
      }
    }

    internal var actionType: FilterAction {
      get {
        return snapshot["actionType"]! as! FilterAction
      }
      set {
        snapshot.updateValue(newValue, forKey: "actionType")
      }
    }

    internal var rule: String {
      get {
        return snapshot["rule"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "rule")
      }
    }

    internal var enableMeta: String? {
      get {
        return snapshot["enableMeta"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "enableMeta")
      }
    }
  }
}

internal struct UserAndDeviceNotificationSettingsOutput: GraphQLFragment {
  internal static let fragmentString =
    "fragment UserAndDeviceNotificationSettingsOutput on UserAndDeviceNotificationSettingsOutput {\n  __typename\n  user {\n    __typename\n    ...NotificationSettingsOutput\n  }\n  device {\n    __typename\n    ...NotificationSettingsOutput\n  }\n}"

  internal static let possibleTypes = ["UserAndDeviceNotificationSettingsOutput"]

  internal static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("user", type: .object(User.selections)),
    GraphQLField("device", type: .object(Device.selections)),
  ]

  internal var snapshot: Snapshot

  internal init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  internal init(user: User? = nil, device: Device? = nil) {
    self.init(snapshot: ["__typename": "UserAndDeviceNotificationSettingsOutput", "user": user.flatMap { $0.snapshot }, "device": device.flatMap { $0.snapshot }])
  }

  internal var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  internal var user: User? {
    get {
      return (snapshot["user"] as? Snapshot).flatMap { User(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "user")
    }
  }

  internal var device: Device? {
    get {
      return (snapshot["device"] as? Snapshot).flatMap { Device(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "device")
    }
  }

  internal struct User: GraphQLSelectionSet {
    internal static let possibleTypes = ["NotificationSettingsOutput"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("filter", type: .nonNull(.list(.nonNull(.object(Filter.selections))))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(filter: [Filter]) {
      self.init(snapshot: ["__typename": "NotificationSettingsOutput", "filter": filter.map { $0.snapshot }])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    internal var filter: [Filter] {
      get {
        return (snapshot["filter"] as! [Snapshot]).map { Filter(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "filter")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var notificationSettingsOutput: NotificationSettingsOutput {
        get {
          return NotificationSettingsOutput(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    internal struct Filter: GraphQLSelectionSet {
      internal static let possibleTypes = ["FilterOutputEntry"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("serviceName", type: .nonNull(.scalar(String.self))),
        GraphQLField("actionType", type: .nonNull(.scalar(FilterAction.self))),
        GraphQLField("rule", type: .nonNull(.scalar(String.self))),
        GraphQLField("enableMeta", type: .scalar(String.self)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(serviceName: String, actionType: FilterAction, rule: String, enableMeta: String? = nil) {
        self.init(snapshot: ["__typename": "FilterOutputEntry", "serviceName": serviceName, "actionType": actionType, "rule": rule, "enableMeta": enableMeta])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var serviceName: String {
        get {
          return snapshot["serviceName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "serviceName")
        }
      }

      internal var actionType: FilterAction {
        get {
          return snapshot["actionType"]! as! FilterAction
        }
        set {
          snapshot.updateValue(newValue, forKey: "actionType")
        }
      }

      internal var rule: String {
        get {
          return snapshot["rule"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "rule")
        }
      }

      internal var enableMeta: String? {
        get {
          return snapshot["enableMeta"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "enableMeta")
        }
      }
    }
  }

  internal struct Device: GraphQLSelectionSet {
    internal static let possibleTypes = ["NotificationSettingsOutput"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("filter", type: .nonNull(.list(.nonNull(.object(Filter.selections))))),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(filter: [Filter]) {
      self.init(snapshot: ["__typename": "NotificationSettingsOutput", "filter": filter.map { $0.snapshot }])
    }

    internal var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    internal var filter: [Filter] {
      get {
        return (snapshot["filter"] as! [Snapshot]).map { Filter(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue.map { $0.snapshot }, forKey: "filter")
      }
    }

    internal var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    internal struct Fragments {
      internal var snapshot: Snapshot

      internal var notificationSettingsOutput: NotificationSettingsOutput {
        get {
          return NotificationSettingsOutput(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    internal struct Filter: GraphQLSelectionSet {
      internal static let possibleTypes = ["FilterOutputEntry"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("serviceName", type: .nonNull(.scalar(String.self))),
        GraphQLField("actionType", type: .nonNull(.scalar(FilterAction.self))),
        GraphQLField("rule", type: .nonNull(.scalar(String.self))),
        GraphQLField("enableMeta", type: .scalar(String.self)),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(serviceName: String, actionType: FilterAction, rule: String, enableMeta: String? = nil) {
        self.init(snapshot: ["__typename": "FilterOutputEntry", "serviceName": serviceName, "actionType": actionType, "rule": rule, "enableMeta": enableMeta])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var serviceName: String {
        get {
          return snapshot["serviceName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "serviceName")
        }
      }

      internal var actionType: FilterAction {
        get {
          return snapshot["actionType"]! as! FilterAction
        }
        set {
          snapshot.updateValue(newValue, forKey: "actionType")
        }
      }

      internal var rule: String {
        get {
          return snapshot["rule"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "rule")
        }
      }

      internal var enableMeta: String? {
        get {
          return snapshot["enableMeta"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "enableMeta")
        }
      }
    }
  }
}
}