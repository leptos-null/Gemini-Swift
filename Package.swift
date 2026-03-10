// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Gemini",
    products: [
        .library(
            name: "Gemini",
            targets: ["Gemini"]
        ),
        .library(
            name: "GeminiTools",
            targets: ["GeminiTools"]
        ),
        .executable(name: "SampleClient", targets: ["SampleClient"])
    ],
    targets: [
        .target(
            name: "Gemini"
        ),
        .target(
            name: "GeminiTools",
            dependencies: [
                .target(name: "Gemini")
            ]
        ),
        .executableTarget(name: "SampleClient", dependencies: [
            .target(name: "GeminiTools")
        ])
    ]
)
