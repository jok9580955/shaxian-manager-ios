import Foundation

enum KitchenLine: String, CaseIterable, Identifiable {
    case dumplings = "蒸饺"
    case noodles = "拌面"
    case stew = "炖罐"

    var id: String { rawValue }

    var iconName: String {
        switch self {
        case .dumplings:
            return "takeoutbag.and.cup.and.straw"
        case .noodles:
            return "fork.knife.circle"
        case .stew:
            return "mug"
        }
    }

    var defaultMinutes: Int {
        switch self {
        case .dumplings:
            return 8
        case .noodles:
            return 3
        case .stew:
            return 18
        }
    }
}

struct KitchenOrder: Identifiable, Hashable {
    let id: UUID
    var tableName: String
    var line: KitchenLine
    var itemName: String
    var quantity: Int
    var startedAt: Date
    var dueAt: Date

    var remainingSeconds: Int {
        max(0, Int(dueAt.timeIntervalSinceNow.rounded()))
    }

    var isReady: Bool {
        remainingSeconds == 0
    }

    var progress: Double {
        let total = dueAt.timeIntervalSince(startedAt)
        guard total > 0 else { return 1 }
        let elapsed = Date().timeIntervalSince(startedAt)
        return min(1, max(0, elapsed / total))
    }
}

struct Customer: Identifiable, Hashable, Codable {
    var id = UUID()
    var name: String
    var phone: String
    var lastOrderSummary: String
    var totalSpend: Decimal
}

struct InventoryItem: Identifiable, Hashable, Codable {
    var id = UUID()
    var name: String
    var stockAmount: String
    var warningLevel: String
    var supplier: String
    var isLowStock: Bool

    init(
        id: UUID = UUID(),
        name: String,
        stockAmount: String,
        warningLevel: String,
        supplier: String,
        isLowStock: Bool = false
    ) {
        self.id = id
        self.name = name
        self.stockAmount = stockAmount
        self.warningLevel = warningLevel
        self.supplier = supplier
        self.isLowStock = isLowStock
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case stockAmount
        case warningLevel
        case supplier
        case isLowStock
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        name = try container.decode(String.self, forKey: .name)
        stockAmount = try container.decode(String.self, forKey: .stockAmount)
        warningLevel = try container.decode(String.self, forKey: .warningLevel)
        supplier = try container.decode(String.self, forKey: .supplier)
        isLowStock = try container.decodeIfPresent(Bool.self, forKey: .isLowStock) ?? false
    }
}

struct LedgerEntry: Identifiable, Hashable, Codable {
    var id = UUID()
    var title: String
    var amount: Decimal
    var category: String
    var date: Date
}

struct StoreSnapshot: Codable {
    var customers: [Customer]
    var inventoryItems: [InventoryItem]
    var ledgerEntries: [LedgerEntry]
}
