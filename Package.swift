// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "swift-bug-method-selector-thunk",
    platforms: [.macOS(.v14)],
    products: [
        .library(name: "BugDemo", targets: ["BugDemo"]),
    ],
    targets: [
        .target(name: "BugDemo"),
    ],
    swiftLanguageModes: [.v5]
)
