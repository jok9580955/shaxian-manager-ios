import Foundation

let displayNames: [String: String] = [
    "zh-Hans": "沙县小吃店铺管家-经营日报-材料库存",
    "zh-Hant": "沙縣小吃店鋪管家-經營日報-材料庫存",
    "ja": "沙県店舗管理",
    "ko": "샤셴 매장관리"
]

let locales = [
    "ar-SA", "ca", "cs", "da", "de-DE", "el", "en", "en-AU", "en-CA", "en-GB", "en-US",
    "es-ES", "es-MX", "fi", "fr-CA", "fr-FR", "he", "hi", "hr", "hu", "id", "it",
    "ja", "ko", "ms", "nl-NL", "no", "pl", "pt-BR", "pt-PT", "ro", "ru", "sk",
    "sv", "th", "tr", "uk", "vi", "zh-Hans", "zh-Hant"
]

func localization(_ value: String, state: String = "translated") -> [String: Any] {
    [
        "stringUnit": [
            "state": state,
            "value": value
        ]
    ]
}

var localizations: [String: Any] = [:]
for locale in locales {
    let value = displayNames[locale] ?? "Shaxian Manager"
    localizations[locale] = localization(value)
}

let catalog: [String: Any] = [
    "sourceLanguage": "zh-Hans",
    "strings": [
        "CFBundleDisplayName": [
            "comment": "Localized app display name shown under the app icon.",
            "extractionState": "manual",
            "localizations": localizations
        ]
    ],
    "version": "1.0"
]

let data = try JSONSerialization.data(withJSONObject: catalog, options: [.prettyPrinted, .sortedKeys])
let outputURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
    .appendingPathComponent("沙县出餐管家/InfoPlist.xcstrings")
try data.write(to: outputURL)
print("Generated InfoPlist.xcstrings with \(locales.count) display-name localizations")
