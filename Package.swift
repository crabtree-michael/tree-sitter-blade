// swift-tools-version:5.9
import PackageDescription


let package = Package(
    name: "TreeSitterBlade",
    platforms: [.macOS(.v10_13), .iOS(.v11)],
    products: [
        .library(name: "TreeSitterBlade", targets: ["TreeSitterBlade"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "TreeSitterBlade",
                path: ".",
                exclude: [
                    "binding.gyp",
                    "bindings",
                    "Cargo.toml",
                    "corpus",
                    "examples",
                    "grammar.js",
                    "LICENSE",
                    "Makefile",
                    "package.json",
                    "README.md",
                    "src/grammar.json",
                    "src/node-types.json",
                    // any additional files to exclude 
                ],
                sources: [
                    "src/parser.c",
                    "src/scanner.cc", // this might be `scanner.c` or not present at all
                ],
                resources: [
                    .copy("queries")
                ],
                publicHeadersPath: "bindings/swift",
                cSettings: [.headerSearchPath("src")])
    ]
)