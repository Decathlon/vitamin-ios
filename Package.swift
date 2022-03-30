// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Vitamin",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "Vitamin",
            targets: ["Vitamin"]),
        .library(
            name: "VitaminCommon",
            targets: ["VitaminCommon"]),
        .library(
            name: "VitaminUIKit",
            targets: ["VitaminUIKit"]),
        .library(
            name: "VitaminSwiftUI",
            targets: ["VitaminSwiftUI"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Vitamin",
            dependencies: ["VitaminUIKit", "VitaminSwiftUI"],
            path: "Sources/Vitamin"),
        .target(
            name: "VitaminCommon",
            dependencies: [],
            path: "Sources/VitaminCommon",
            exclude: [
                "Foundations/Assets/README.md",
                "Foundations/Colors/README.md",
                "Foundations/Icons/README.md",
                "Foundations/Radiuses/README.md",
                "Foundations/Shadows/README.md",
                "Foundations/Typography/README.md",
                "Utils/SwiftGen"
            ],
            resources: [
                .process("Foundations/Assets/VitaminAssets.xcassets"),
                .process("Foundations/Icons/Vitamix.xcassets"),
                .process("Foundations/Typography/Fonts/Roboto-Bold.ttf"),
                .process("Foundations/Typography/Fonts/Roboto-Regular.ttf"),
                .process("Foundations/Typography/Fonts/RobotoCondensed-BoldItalic.ttf")
            ]),
        .target(
            name: "VitaminUIKit",
            dependencies: ["VitaminCommon"],
            path: "Sources/VitaminUIKit",
            exclude: [
                "Components/Badge/README.md",
                "Components/Button/README.md",
                "Components/Progressbar/README.md",
                "Components/Switch/README.md",
                "Components/Tag/README.md",
                "Components/TextField/README.md"
            ],
            resources: [
                .process("Components/TextField/VitaminTextField.xib")
            ]),
        .target(
            name: "VitaminSwiftUI",
            dependencies: ["VitaminCommon"],
            path: "Sources/VitaminSwiftUI",
            exclude: [
            ])
    ]
)
