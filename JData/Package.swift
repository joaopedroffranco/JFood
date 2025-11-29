// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "JData",
	platforms: [
		.iOS(.v16),
	],
	products: [
		.library(
			name: "JData",
			targets: ["JData"]),
	],
	dependencies: [
		.package(name: "JFoundation", path: "../JFoundation"),
	],
	targets: [
		.target(
			name: "JData",
			dependencies: ["JFoundation"]),
		.testTarget(
			name: "JDataTests",
			dependencies: ["JData"],
			resources: [.process("JSONs")]
		),
	]
)
