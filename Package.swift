// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SudoNotification",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "SudoNotification",
            targets: ["SudoNotification"]),
        .library(
            name: "SudoNotificationExtension",
            targets: ["SudoNotificationExtension"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/sudoplatform/sudo-api-client-ios", from: "14.0.0"),
        .package(url: "https://github.com/sudoplatform/sudo-config-manager-ios", from: "6.0.0"),
        .package(url: "https://github.com/sudoplatform/sudo-logging-ios", from: "3.0.0"),
        .package(url: "https://github.com/sudoplatform/sudo-key-manager-ios", from: "5.0.0"),
        .package(url: "https://github.com/sudoplatform/sudo-user-ios", from: "19.0.0"),
        .package(url: "https://github.com/aws-amplify/amplify-swift", from: "2.49.1"),

    ],
    targets: [
        .target(
            name: "SudoNotification",
            dependencies: [
                .product(name: "Amplify", package: "amplify-swift"),
                .product(name: "SudoUser", package: "sudo-user-ios"),
                .product(name: "SudoLogging", package: "sudo-logging-ios"),
                .product(name: "SudoKeyManager", package: "sudo-key-manager-ios"),
                .product(name: "SudoApiClient", package: "sudo-api-client-ios"),
                .product(name: "SudoConfigManager", package: "sudo-config-manager-ios"),
            ],
            path: "SudoNotification/",
            swiftSettings: [.swiftLanguageMode(.v5)]
        ),
        .target(
            name: "SudoNotificationExtension",
            dependencies: [
                .product(name: "SudoLogging", package: "sudo-logging-ios")
            ],
            path: "SudoNotificationExtension",
            swiftSettings: [.swiftLanguageMode(.v5)]
        ),
    ]
)

