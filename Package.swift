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
    ],
    targets: [
        .target(
            name: "Gemini",
            exclude: [
                // explicitly exclude supporting files to avoid swift build warnings.
                // this list can be generated using:
                // `find -s 'Sources/Gemini' -name '*\.md' | while read FULL_PATH; do printf '"%s",\n' "${FULL_PATH#Sources/Gemini/}"; done`
                "Caching/README.md",
                "Caching/upstream_doc.md",
                "Generate/README.md",
                "Generate/upstream_doc.md",
                "Live/README.md",
                "Live/upstream_doc.md",
                "LiveMusic/README.md",
                "LiveMusic/upstream_doc.md",
                "Models/README.md",
                "Models/upstream_doc.md",
            ]
        ),
    ]
)
