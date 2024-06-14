// swiftlint:disable all
//  This file was automatically generated and should not be edited.

import AWSAppSync

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

internal enum FilterAction: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case enable
  case disable
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "ENABLE": self = .enable
      case "DISABLE": self = .disable
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .enable: return "ENABLE"
      case .disable: return "DISABLE"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: FilterAction, rhs: FilterAction) -> Bool {
    switch (lhs, rhs) {
      case (.enable, .enable): return true
      case (.disable, .disable): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal struct RegisterAppOnDeviceInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(bundleId: String, deviceId: String, clientEnv: clientEnvType, standardToken: Optional<String?> = nil, voipToken: Optional<String?> = nil, build: Optional<buildType?> = nil, locale: Optional<String?> = nil, version: Optional<String?> = nil) {
    graphQLMap = ["bundleId": bundleId, "deviceId": deviceId, "clientEnv": clientEnv, "standardToken": standardToken, "voipToken": voipToken, "build": build, "locale": locale, "version": version]
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

  internal var clientEnv: clientEnvType {
    get {
      return graphQLMap["clientEnv"] as! clientEnvType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "clientEnv")
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

  internal var voipToken: Optional<String?> {
    get {
      return graphQLMap["voipToken"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "voipToken")
    }
  }

  internal var build: Optional<buildType?> {
    get {
      return graphQLMap["build"] as! Optional<buildType?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "build")
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

  internal var version: Optional<String?> {
    get {
      return graphQLMap["version"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "version")
    }
  }
}

internal enum clientEnvType: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case ios
  case android
  case testInbound
  case testOutbound
  case webhook
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "IOS": self = .ios
      case "ANDROID": self = .android
      case "TEST_INBOUND": self = .testInbound
      case "TEST_OUTBOUND": self = .testOutbound
      case "WEBHOOK": self = .webhook
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .ios: return "IOS"
      case .android: return "ANDROID"
      case .testInbound: return "TEST_INBOUND"
      case .testOutbound: return "TEST_OUTBOUND"
      case .webhook: return "WEBHOOK"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: clientEnvType, rhs: clientEnvType) -> Bool {
    switch (lhs, rhs) {
      case (.ios, .ios): return true
      case (.android, .android): return true
      case (.testInbound, .testInbound): return true
      case (.testOutbound, .testOutbound): return true
      case (.webhook, .webhook): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal enum buildType: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case release
  case debug
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "RELEASE": self = .release
      case "DEBUG": self = .debug
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .release: return "RELEASE"
      case .debug: return "DEBUG"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: buildType, rhs: buildType) -> Bool {
    switch (lhs, rhs) {
      case (.release, .release): return true
      case (.debug, .debug): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

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

internal struct UpdateSettingsInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(bundleId: String, deviceId: String, filter: [Filter?], services: [NotifiableServiceSchema]) {
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

  internal var deviceId: String {
    get {
      return graphQLMap["deviceId"] as! String
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

  internal init(serviceName: String, actionType: FilterAction, rule: String, enableMeta: Optional<String?> = nil) {
    graphQLMap = ["serviceName": serviceName, "actionType": actionType, "rule": rule, "enableMeta": enableMeta]
  }

  internal var serviceName: String {
    get {
      return graphQLMap["serviceName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "serviceName")
    }
  }

  internal var actionType: FilterAction {
    get {
      return graphQLMap["actionType"] as! FilterAction
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "actionType")
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

  internal var enableMeta: Optional<String?> {
    get {
      return graphQLMap["enableMeta"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "enableMeta")
    }
  }
}

internal struct NotifiableServiceSchema: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(serviceName: String, schema: Optional<[SchemaEntry]?> = nil) {
    graphQLMap = ["serviceName": serviceName, "schema": schema]
  }

  internal var serviceName: String {
    get {
      return graphQLMap["serviceName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "serviceName")
    }
  }

  internal var schema: Optional<[SchemaEntry]?> {
    get {
      return graphQLMap["schema"] as! Optional<[SchemaEntry]?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "schema")
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

internal struct UpdateInfoInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(bundleId: String, deviceId: String, build: Optional<buildType?> = nil, locale: Optional<String?> = nil, standardToken: Optional<String?> = nil, voipToken: Optional<String?> = nil, version: Optional<String?> = nil) {
    graphQLMap = ["bundleId": bundleId, "deviceId": deviceId, "build": build, "locale": locale, "standardToken": standardToken, "voipToken": voipToken, "version": version]
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

  internal var build: Optional<buildType?> {
    get {
      return graphQLMap["build"] as! Optional<buildType?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "build")
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

  internal var voipToken: Optional<String?> {
    get {
      return graphQLMap["voipToken"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "voipToken")
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
}

internal struct NotificationProviderInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(bundleId: String, appName: Optional<String?> = nil, platform: platformProviderType, notificationType: notificationType, principal: Optional<String?> = nil, credentials: Optional<String?> = nil) {
    graphQLMap = ["bundleId": bundleId, "appName": appName, "platform": platform, "notificationType": notificationType, "principal": principal, "credentials": credentials]
  }

  internal var bundleId: String {
    get {
      return graphQLMap["bundleId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bundleId")
    }
  }

  internal var appName: Optional<String?> {
    get {
      return graphQLMap["appName"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "appName")
    }
  }

  internal var platform: platformProviderType {
    get {
      return graphQLMap["platform"] as! platformProviderType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "platform")
    }
  }

  internal var notificationType: notificationType {
    get {
      return graphQLMap["notificationType"] as! notificationType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notificationType")
    }
  }

  internal var principal: Optional<String?> {
    get {
      return graphQLMap["principal"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "principal")
    }
  }

  internal var credentials: Optional<String?> {
    get {
      return graphQLMap["credentials"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "credentials")
    }
  }
}

internal enum platformProviderType: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case apns
  case apnsSandbox
  case apnsVoip
  case apnsVoipSandbox
  case gcm
  case test
  case webhook
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "APNS": self = .apns
      case "APNS_SANDBOX": self = .apnsSandbox
      case "APNS_VOIP": self = .apnsVoip
      case "APNS_VOIP_SANDBOX": self = .apnsVoipSandbox
      case "GCM": self = .gcm
      case "TEST": self = .test
      case "WEBHOOK": self = .webhook
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .apns: return "APNS"
      case .apnsSandbox: return "APNS_SANDBOX"
      case .apnsVoip: return "APNS_VOIP"
      case .apnsVoipSandbox: return "APNS_VOIP_SANDBOX"
      case .gcm: return "GCM"
      case .test: return "TEST"
      case .webhook: return "WEBHOOK"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: platformProviderType, rhs: platformProviderType) -> Bool {
    switch (lhs, rhs) {
      case (.apns, .apns): return true
      case (.apnsSandbox, .apnsSandbox): return true
      case (.apnsVoip, .apnsVoip): return true
      case (.apnsVoipSandbox, .apnsVoipSandbox): return true
      case (.gcm, .gcm): return true
      case (.test, .test): return true
      case (.webhook, .webhook): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal enum notificationType: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  internal typealias RawValue = String
  case standard
  case voip
  case both
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  internal init?(rawValue: RawValue) {
    switch rawValue {
      case "STANDARD": self = .standard
      case "VOIP": self = .voip
      case "BOTH": self = .both
      default: self = .unknown(rawValue)
    }
  }

  internal var rawValue: RawValue {
    switch self {
      case .standard: return "STANDARD"
      case .voip: return "VOIP"
      case .both: return "BOTH"
      case .unknown(let value): return value
    }
  }

  internal static func == (lhs: notificationType, rhs: notificationType) -> Bool {
    switch (lhs, rhs) {
      case (.standard, .standard): return true
      case (.voip, .voip): return true
      case (.both, .both): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

internal struct UseNotificationProviderInput: GraphQLMapConvertible {
  internal var graphQLMap: GraphQLMap

  internal init(bundleId: String, appName: Optional<String?> = nil, platform: platformProviderType, notificationType: notificationType, providerArn: String) {
    graphQLMap = ["bundleId": bundleId, "appName": appName, "platform": platform, "notificationType": notificationType, "providerArn": providerArn]
  }

  internal var bundleId: String {
    get {
      return graphQLMap["bundleId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bundleId")
    }
  }

  internal var appName: Optional<String?> {
    get {
      return graphQLMap["appName"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "appName")
    }
  }

  internal var platform: platformProviderType {
    get {
      return graphQLMap["platform"] as! platformProviderType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "platform")
    }
  }

  internal var notificationType: notificationType {
    get {
      return graphQLMap["notificationType"] as! notificationType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notificationType")
    }
  }

  internal var providerArn: String {
    get {
      return graphQLMap["providerArn"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "providerArn")
    }
  }
}

internal final class GetNotificationSettingsQuery: GraphQLQuery {
  internal static let operationString =
    "query GetNotificationSettings($input: GetSettingsInput!) {\n  getNotificationSettings(input: $input) {\n    __typename\n    filter {\n      __typename\n      serviceName\n      actionType\n      rule\n      enableMeta\n    }\n  }\n}"

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
        GraphQLField("filter", type: .nonNull(.list(.object(Filter.selections)))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(filter: [Filter?]) {
        self.init(snapshot: ["__typename": "NotificationSettingsOutput", "filter": filter.map { $0.flatMap { $0.snapshot } }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var filter: [Filter?] {
        get {
          return (snapshot["filter"] as! [Snapshot?]).map { $0.flatMap { Filter(snapshot: $0) } }
        }
        set {
          snapshot.updateValue(newValue.map { $0.flatMap { $0.snapshot } }, forKey: "filter")
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

internal final class GetTokensQuery: GraphQLQuery {
  internal static let operationString =
    "query GetTokens($limit: Int, $nextToken: String) {\n  getTokens(limit: $limit, nextToken: $nextToken) {\n    __typename\n    nextToken\n    todos {\n      __typename\n      appID\n      id\n      token\n    }\n  }\n}"

  internal var limit: Int?
  internal var nextToken: String?

  internal init(limit: Int? = nil, nextToken: String? = nil) {
    self.limit = limit
    self.nextToken = nextToken
  }

  internal var variables: GraphQLMap? {
    return ["limit": limit, "nextToken": nextToken]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Query"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("getTokens", arguments: ["limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(GetToken.selections)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(getTokens: GetToken? = nil) {
      self.init(snapshot: ["__typename": "Query", "getTokens": getTokens.flatMap { $0.snapshot }])
    }

    internal var getTokens: GetToken? {
      get {
        return (snapshot["getTokens"] as? Snapshot).flatMap { GetToken(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getTokens")
      }
    }

    internal struct GetToken: GraphQLSelectionSet {
      internal static let possibleTypes = ["TokenConnection"]

      internal static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("nextToken", type: .scalar(String.self)),
        GraphQLField("todos", type: .list(.object(Todo.selections))),
      ]

      internal var snapshot: Snapshot

      internal init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      internal init(nextToken: String? = nil, todos: [Todo?]? = nil) {
        self.init(snapshot: ["__typename": "TokenConnection", "nextToken": nextToken, "todos": todos.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
      }

      internal var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      internal var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      internal var todos: [Todo?]? {
        get {
          return (snapshot["todos"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Todo(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "todos")
        }
      }

      internal struct Todo: GraphQLSelectionSet {
        internal static let possibleTypes = ["NotificationToken"]

        internal static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("appID", type: .scalar(String.self)),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("token", type: .scalar(String.self)),
        ]

        internal var snapshot: Snapshot

        internal init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        internal init(appId: String? = nil, id: GraphQLID, token: String? = nil) {
          self.init(snapshot: ["__typename": "NotificationToken", "appID": appId, "id": id, "token": token])
        }

        internal var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        internal var appId: String? {
          get {
            return snapshot["appID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "appID")
          }
        }

        internal var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        internal var token: String? {
          get {
            return snapshot["token"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "token")
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

internal final class UpdateNotificationSettingsMutation: GraphQLMutation {
  internal static let operationString =
    "mutation UpdateNotificationSettings($input: UpdateSettingsInput!) {\n  updateNotificationSettings(input: $input)\n}"

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

internal final class UpdateDeviceInfoMutation: GraphQLMutation {
  internal static let operationString =
    "mutation UpdateDeviceInfo($input: UpdateInfoInput!) {\n  updateDeviceInfo(input: $input)\n}"

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

internal final class ConfigureNotificationProviderMutation: GraphQLMutation {
  internal static let operationString =
    "mutation ConfigureNotificationProvider($input: NotificationProviderInput) {\n  configureNotificationProvider(input: $input)\n}"

  internal var input: NotificationProviderInput?

  internal init(input: NotificationProviderInput? = nil) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("configureNotificationProvider", arguments: ["input": GraphQLVariable("input")], type: .scalar(Bool.self)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(configureNotificationProvider: Bool? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "configureNotificationProvider": configureNotificationProvider])
    }

    internal var configureNotificationProvider: Bool? {
      get {
        return snapshot["configureNotificationProvider"] as? Bool
      }
      set {
        snapshot.updateValue(newValue, forKey: "configureNotificationProvider")
      }
    }
  }
}

internal final class UseNotificationProviderMutation: GraphQLMutation {
  internal static let operationString =
    "mutation UseNotificationProvider($input: UseNotificationProviderInput) {\n  useNotificationProvider(input: $input)\n}"

  internal var input: UseNotificationProviderInput?

  internal init(input: UseNotificationProviderInput? = nil) {
    self.input = input
  }

  internal var variables: GraphQLMap? {
    return ["input": input]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("useNotificationProvider", arguments: ["input": GraphQLVariable("input")], type: .scalar(Bool.self)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(useNotificationProvider: Bool? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "useNotificationProvider": useNotificationProvider])
    }

    internal var useNotificationProvider: Bool? {
      get {
        return snapshot["useNotificationProvider"] as? Bool
      }
      set {
        snapshot.updateValue(newValue, forKey: "useNotificationProvider")
      }
    }
  }
}

internal final class DeleteNotificationTokenMutation: GraphQLMutation {
  internal static let operationString =
    "mutation DeleteNotificationToken($tokenID: String) {\n  deleteNotificationToken(tokenID: $tokenID)\n}"

  internal var tokenID: String?

  internal init(tokenID: String? = nil) {
    self.tokenID = tokenID
  }

  internal var variables: GraphQLMap? {
    return ["tokenID": tokenID]
  }

  internal struct Data: GraphQLSelectionSet {
    internal static let possibleTypes = ["Mutation"]

    internal static let selections: [GraphQLSelection] = [
      GraphQLField("deleteNotificationToken", arguments: ["tokenID": GraphQLVariable("tokenID")], type: .scalar(Bool.self)),
    ]

    internal var snapshot: Snapshot

    internal init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    internal init(deleteNotificationToken: Bool? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteNotificationToken": deleteNotificationToken])
    }

    internal var deleteNotificationToken: Bool? {
      get {
        return snapshot["deleteNotificationToken"] as? Bool
      }
      set {
        snapshot.updateValue(newValue, forKey: "deleteNotificationToken")
      }
    }
  }
}
// swiftlint:enable all
