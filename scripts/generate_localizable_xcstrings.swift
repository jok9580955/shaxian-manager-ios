import Foundation

let locales = [
    "ar-SA", "ca", "cs", "da", "de-DE", "el", "en", "en-AU", "en-CA", "en-GB", "en-US",
    "es-ES", "es-MX", "fi", "fr-CA", "fr-FR", "he", "hi", "hr", "hu", "id", "it",
    "ja", "ko", "ms", "nl-NL", "no", "pl", "pt-BR", "pt-PT", "ro", "ru", "sk",
    "sv", "th", "tr", "uk", "vi", "zh-Hant"
]

struct Entry {
    let key: String
    let en: String
    let zhHant: String
}

let entries: [Entry] = [
    Entry(key: "日报", en: "Report", zhHant: "日報"),
    Entry(key: "出餐", en: "Kitchen", zhHant: "出餐"),
    Entry(key: "经营日报", en: "Business Report", zhHant: "經營日報"),
    Entry(key: "客户管理", en: "Customers", zhHant: "客戶管理"),
    Entry(key: "库存管理", en: "Inventory", zhHant: "庫存管理"),
    Entry(key: "财务记录", en: "Ledger", zhHant: "財務記錄"),
    Entry(key: "店铺日报", en: "Store Report", zhHant: "店鋪日報"),
    Entry(key: "新增客户", en: "Add Customer", zhHant: "新增客戶"),
    Entry(key: "新增材料", en: "Add Material", zhHant: "新增材料"),
    Entry(key: "新增流水", en: "Add Entry", zhHant: "新增流水"),
    Entry(key: "新增记录", en: "Add Record", zhHant: "新增記錄"),
    Entry(key: "编辑客户", en: "Edit Customer", zhHant: "編輯客戶"),
    Entry(key: "编辑材料", en: "Edit Material", zhHant: "編輯材料"),
    Entry(key: "编辑流水", en: "Edit Entry", zhHant: "編輯流水"),
    Entry(key: "删除", en: "Delete", zhHant: "刪除"),
    Entry(key: "编辑", en: "Edit", zhHant: "編輯"),
    Entry(key: "取消", en: "Cancel", zhHant: "取消"),
    Entry(key: "保存", en: "Save", zhHant: "儲存"),
    Entry(key: "今日经营", en: "Today", zhHant: "今日經營"),
    Entry(key: "沙县小吃", en: "Shaxian Snacks", zhHant: "沙縣小吃"),
    Entry(key: "客户档案", en: "Customer Records", zhHant: "客戶檔案"),
    Entry(key: "材料库存", en: "Material Inventory", zhHant: "材料庫存"),
    Entry(key: "净流水", en: "Net Cashflow", zhHant: "淨流水"),
    Entry(key: "回头客、团餐客户、联系方式", en: "Repeat customers, group orders, contacts", zhHant: "回頭客、團餐客戶、聯絡方式"),
    Entry(key: "预警材料 / 全部材料", en: "Alerts / all materials", zhHant: "預警材料 / 全部材料"),
    Entry(key: "收入、进货、平台费", en: "Income, purchases, platform fees", zhHant: "收入、進貨、平台費"),
    Entry(key: "库存范围", en: "Inventory Range", zhHant: "庫存範圍"),
    Entry(key: "流水范围", en: "Ledger Range", zhHant: "流水範圍"),
    Entry(key: "全部", en: "All", zhHant: "全部"),
    Entry(key: "预警", en: "Alert", zhHant: "預警"),
    Entry(key: "今天", en: "Today", zhHant: "今天"),
    Entry(key: "客户信息", en: "Customer Info", zhHant: "客戶資訊"),
    Entry(key: "客户名称", en: "Customer Name", zhHant: "客戶名稱"),
    Entry(key: "手机号", en: "Phone", zhHant: "手機號"),
    Entry(key: "最近消费", en: "Recent Order", zhHant: "最近消費"),
    Entry(key: "累计消费", en: "Total Spend", zhHant: "累計消費"),
    Entry(key: "材料名称", en: "Material Name", zhHant: "材料名稱"),
    Entry(key: "当前余量，例如 8 袋", en: "Current stock, e.g. 8 bags", zhHant: "目前餘量，例如 8 袋"),
    Entry(key: "补货提醒，例如 低于 6 袋提醒", en: "Restock reminder, e.g. alert below 6 bags", zhHant: "補貨提醒，例如低於 6 袋提醒"),
    Entry(key: "供应商", en: "Supplier", zhHant: "供應商"),
    Entry(key: "标记为需要补货", en: "Mark as restock needed", zhHant: "標記為需要補貨"),
    Entry(key: "流水信息", en: "Ledger Info", zhHant: "流水資訊"),
    Entry(key: "事项，例如 晚市流水", en: "Item, e.g. evening sales", zhHant: "事項，例如晚市流水"),
    Entry(key: "金额", en: "Amount", zhHant: "金額"),
    Entry(key: "类型", en: "Type", zhHant: "類型"),
    Entry(key: "收入", en: "Income", zhHant: "收入"),
    Entry(key: "支出", en: "Expense", zhHant: "支出"),
    Entry(key: "分类", en: "Category", zhHant: "分類"),
    Entry(key: "日期", en: "Date", zhHant: "日期"),
    Entry(key: "三线出餐", en: "Kitchen Lines", zhHant: "三線出餐"),
    Entry(key: "新增", en: "Add", zhHant: "新增"),
    Entry(key: "蒸饺 / 拌面 / 炖罐", en: "Dumplings / Noodles / Stew", zhHant: "蒸餃 / 拌麵 / 燉罐"),
    Entry(key: "同时盯住三个出餐口，先到点的桌号会自动排在前面。", en: "Watch three kitchen lines at once. Orders due first move to the front.", zhHant: "同時盯住三個出餐口，先到點的桌號會自動排在前面。"),
    Entry(key: "高峰期模式", en: "Rush Mode", zhHant: "高峰期模式"),
    Entry(key: "当前没有排队，出餐口空闲。", en: "No orders waiting. This line is idle.", zhHant: "目前沒有排隊，出餐口空閒。"),
    Entry(key: "可上菜", en: "Ready", zhHant: "可上菜"),
    Entry(key: "蒸饺", en: "Dumplings", zhHant: "蒸餃"),
    Entry(key: "拌面", en: "Noodles", zhHant: "拌麵"),
    Entry(key: "炖罐", en: "Stew", zhHant: "燉罐")
]

func localization(_ value: String, state: String = "translated") -> [String: Any] {
    [
        "stringUnit": [
            "state": state,
            "value": value
        ]
    ]
}

var strings: [String: Any] = [:]
for entry in entries {
    var localizations: [String: Any] = [
        "zh-Hans": localization(entry.key),
        "zh-Hant": localization(entry.zhHant),
        "en": localization(entry.en),
        "en-US": localization(entry.en),
        "en-GB": localization(entry.en),
        "en-AU": localization(entry.en),
        "en-CA": localization(entry.en)
    ]

    for locale in locales where localizations[locale] == nil {
        localizations[locale] = localization(entry.en)
    }

    strings[entry.key] = [
        "comment": "Generated first-pass UI localization.",
        "extractionState": "manual",
        "localizations": localizations
    ]
}

let catalog: [String: Any] = [
    "sourceLanguage": "zh-Hans",
    "strings": strings,
    "version": "1.0"
]

let data = try JSONSerialization.data(withJSONObject: catalog, options: [.prettyPrinted, .sortedKeys])
let outputURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
    .appendingPathComponent("沙县出餐管家/Localizable.xcstrings")
try data.write(to: outputURL)
print("Generated \(entries.count) UI string keys at \(outputURL.path)")
