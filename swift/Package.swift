// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "cw",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
        .package(url: "https://github.com/kareman/SwiftShell.git", from: "5.1.0"),
    ],
    targets: [
        .executableTarget(
            name: "cw",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
		.product(name: "SwiftShell", package: "swiftshell"),
            ]
        ),
    ]
)
