import Foundation

let root = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let generator = root.appendingPathComponent("scripts/localize_fastlane_metadata.js").path
let audit = root.appendingPathComponent("scripts/audit_metadata.js").path

func run(_ arguments: [String]) throws {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
    process.arguments = arguments
    process.currentDirectoryURL = root
    try process.run()
    process.waitUntilExit()

    guard process.terminationStatus == 0 else {
        throw NSError(
            domain: "GenerateFastlaneMetadata",
            code: Int(process.terminationStatus),
            userInfo: [NSLocalizedDescriptionKey: "\(arguments.joined(separator: " ")) failed"]
        )
    }
}

try run(["node", generator])
try run(["node", audit])

print("Generated localized App Store metadata at \(root.appendingPathComponent("fastlane/metadata").path)")
