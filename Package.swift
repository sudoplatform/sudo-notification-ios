// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SudoNotification",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "SudoNotification",
            targets: ["SudoNotification"]),
        .library(
            name: "SudoNotificationExtension",
            targets: ["SudoNotificationExtension"])
    ],
    dependencies: [
        .package(url: "https://github.com/sudoplatform/sudo-api-client-ios", from: "12.0.0"),
        .package(url: "https://github.com/sudoplatform/sudo-config-manager-ios", from: "4.0.0"),
        .package(url: "https://github.com/sudoplatform/sudo-logging-ios", from: "2.0.0"),
        .package(url: "https://github.com/sudoplatform/sudo-key-manager-ios", from: "4.0.0"),
        .package(url: "https://github.com/sudoplatform/sudo-user-ios", from: "17.0.3"),
        .package(url: "https://github.com/sudoplatform/aws-mobile-appsync-sdk-ios.git", exact: "3.7.2"),
    ],
    targets: [
        .target(
            name: "SudoNotification",
            dependencies: [
                .product(name: "AWSAppSync", package: "aws-mobile-appsync-sdk-ios"),
                .product(name: "SudoUser", package: "sudo-user-ios"),
                .product(name: "SudoLogging", package: "sudo-logging-ios"),
                .product(name: "SudoKeyManager", package: "sudo-key-manager-ios"),
                .product(name: "SudoApiClient", package: "sudo-api-client-ios"),
                .product(name: "SudoConfigManager", package: "sudo-config-manager-ios"),
            ],
            path: "SudoNotification/"),
        .target(
            name: "SudoNotificationExtension",
            dependencies: [
                .product(name: "SudoLogging", package: "sudo-logging-ios")
            ],
            path: "SudoNotificationExtension"),
    ]
)

