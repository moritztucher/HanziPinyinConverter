// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "HanziPinyinConverter",
    platforms: [
        .iOS("12"), .macOS("10")
    ],
    products: [
        .library(
            name: "HanziPinyinConverter",
            targets: ["HanziPinyinConverter"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "HanziPinyinConverter",
            dependencies: [],
            resources: [.process("Resources/hanzi_pinyin.json")] // Include JSON resource
        ),
        .testTarget(
            name: "HanziPinyinConverterTests",
            dependencies: ["HanziPinyinConverter"]),
    ]
)
