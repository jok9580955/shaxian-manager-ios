import Foundation

enum SampleData {
    static var orders: [KitchenOrder] {
        let now = Date()
        return [
            KitchenOrder(
                id: UUID(),
                tableName: "3号桌",
                line: .stew,
                itemName: "莲子排骨炖罐",
                quantity: 1,
                startedAt: now.addingTimeInterval(-7 * 60),
                dueAt: now.addingTimeInterval(11 * 60)
            ),
            KitchenOrder(
                id: UUID(),
                tableName: "外卖 A18",
                line: .dumplings,
                itemName: "蒸饺",
                quantity: 2,
                startedAt: now.addingTimeInterval(-5 * 60),
                dueAt: now.addingTimeInterval(3 * 60)
            ),
            KitchenOrder(
                id: UUID(),
                tableName: "7号桌",
                line: .noodles,
                itemName: "花生酱拌面",
                quantity: 3,
                startedAt: now.addingTimeInterval(-2 * 60),
                dueAt: now.addingTimeInterval(45)
            )
        ]
    }

    static let customers = [
        Customer(name: "老陈", phone: "138****5721", lastOrderSummary: "拌面 2 份、扁肉 1 碗", totalSpend: 286),
        Customer(name: "附近工地", phone: "135****8910", lastOrderSummary: "团餐 12 份", totalSpend: 1260),
        Customer(name: "小林", phone: "159****3312", lastOrderSummary: "炖罐套餐", totalSpend: 92)
    ]

    static let inventoryItems = [
        InventoryItem(name: "冻蒸饺", stockAmount: "8 袋", warningLevel: "低于 6 袋提醒", supplier: "城西冻品"),
        InventoryItem(name: "花生酱", stockAmount: "2 桶", warningLevel: "低于 3 桶提醒", supplier: "三明调料行", isLowStock: true),
        InventoryItem(name: "炖罐汤料包", stockAmount: "42 包", warningLevel: "低于 20 包提醒", supplier: "老汤供应")
    ]

    static let ledgerEntries = [
        LedgerEntry(title: "午市流水", amount: 1868, category: "收入", date: .now),
        LedgerEntry(title: "冻品进货", amount: -520, category: "库存成本", date: .now),
        LedgerEntry(title: "外卖平台服务费", amount: -96, category: "费用", date: .now)
    ]
}
