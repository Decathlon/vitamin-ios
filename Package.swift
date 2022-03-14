// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Vitamin",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Vitamin",
            targets: ["Vitamin"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Vitamin",
            dependencies: [],
            exclude: [
                "Utils/SwiftGen",
                "Components/Badge/README.md",
                "Components/Button/README.md",
                "Components/Switch/README.md",
                "Components/TextField/README.md",
                "Foundations/Assets/README.md",
                "Foundations/Colors/README.md",
                "Foundations/Icons/README.md",
                "Foundations/Radiuses/README.md",
                "Foundations/Shadows/README.md",
                "Foundations/Typography/README.md"
            ],
            resources: [
                .process("Foundations/Typography/Fonts/Roboto-Regular.ttf"),
                .process("Foundations/Typography/Fonts/Roboto-Bold.ttf"),
                .process("Foundations/Typography/Fonts/RobotoCondensed-BoldItalic.ttf"),
                .process("Foundations/Icons/Vitamix.xcassets"),
                .process("Components/TextField/VitaminTextField.xib")
            ])
    ]
)
