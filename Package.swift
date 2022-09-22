// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Vitamin",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "VitaminCore",
            targets: ["VitaminCore"]),
        .library(
            name: "Vitamin",
            targets: ["Vitamin"]),
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
            name: "VitaminCore",
            dependencies: [],
            path: "Sources/VitaminCore",
            exclude: [
                "Utils/SwiftGen"
            ],
            resources: [
                .process("Foundations/Assets/VitaminAssets.xcassets"),
                .process("Foundations/Icons/Vitamix.xcassets"),
                .process("Foundations/Typography/Fonts")
            ]),
        .target(
            name: "Vitamin",
            dependencies: ["VitaminCore"],
            path: "Sources/VitaminUIKit",
            exclude: [
                "Components/Badge/README.md",
                "Components/Button/README.md",
                "Components/Progressbar/README.md",
                "Components/Switch/README.md",
                "Components/Tag/README.md",
                "Components/TextField/README.md",
                "Foundations/Assets/README.md",
                "Foundations/Colors/README.md",
                "Foundations/Icons/README.md",
                "Foundations/Radiuses/README.md",
                "Foundations/Shadows/README.md",
                "Foundations/Typography/README.md"
            ],
            resources: [
                .process("Components/TextField/VitaminTextField.xib")
            ]),
        .target(
            name: "VitaminSwiftUI",
            dependencies: ["VitaminCore"],
            path: "Sources/VitaminSwiftUI",
            exclude: [
                "README.md",
                "Components/Button/README.md",
                "Foundations/Assets/README.md",
                "Foundations/Colors/README.md",
                "Foundations/Icons/README.md",
                "Foundations/Radiuses/README.md",
                "Foundations/Shadows/README.md",
                "Foundations/Typography/README.md"
            ])
    ]
)
