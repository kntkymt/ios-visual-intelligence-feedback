// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "Package",
    platforms: [.iOS(.v26)],
    products: [
        .library(
            name: "SampleAppIntents",
            targets: ["SampleAppIntents"]
        ),
        .library(
            name: "SampleAppVisualIntelligenceIntent",
            targets: [
                "SampleAppVisualIntelligenceIntent"
            ]
        )
    ],
    targets: [
        .target(
            name: "SampleAppIntents",
            dependencies: [
            ]
        ),
        .target(
            name: "SampleAppVisualIntelligenceIntent",
            dependencies: [
                "SampleAppIntents"
            ]
        )
    ]
)
