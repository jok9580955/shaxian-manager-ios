import SwiftUI

struct ERPOverviewView: View {
    @Binding var customers: [Customer]
    @Binding var inventoryItems: [InventoryItem]
    @Binding var ledgerEntries: [LedgerEntry]
    @State private var activeForm: ERPForm?
    @State private var inventoryFilter: InventoryFilter = .all
    @State private var ledgerFilter: LedgerFilter = .today

    private var lowStockItems: [InventoryItem] {
        inventoryItems.filter(\.isLowStock)
    }

    private var visibleInventoryItems: [InventoryItem] {
        switch inventoryFilter {
        case .all:
            return inventoryItems
        case .lowStock:
            return lowStockItems
        }
    }

    private var todaysLedgerEntries: [LedgerEntry] {
        ledgerEntries.filter { Calendar.current.isDateInToday($0.date) }
    }

    private var visibleLedgerEntries: [LedgerEntry] {
        switch ledgerFilter {
        case .today:
            return todaysLedgerEntries
        case .all:
            return ledgerEntries
        }
    }

    private var todayRevenue: Decimal {
        todaysLedgerEntries.filter { $0.amount > 0 }.map(\.amount).reduce(0, +)
    }

    private var todayCost: Decimal {
        abs(todaysLedgerEntries.filter { $0.amount < 0 }.map(\.amount).reduce(0, +))
    }

    private var netCashflow: Decimal {
        todaysLedgerEntries.map(\.amount).reduce(0, +)
    }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    DailyReportHeader(
                        revenue: currency(todayRevenue),
                        cost: currency(todayCost),
                        netCashflow: currency(netCashflow)
                    )
                }

                Section("经营日报") {
                    MetricRow(title: "客户档案", value: "\(customers.count)", subtitle: "回头客、团餐客户、联系方式", systemImage: "person.2")
                    MetricRow(title: "材料库存", value: "\(lowStockItems.count)/\(inventoryItems.count)", subtitle: "预警材料 / 全部材料", systemImage: "shippingbox")
                    MetricRow(title: "净流水", value: currency(netCashflow), subtitle: "收入、进货、平台费", systemImage: "yensign.circle")
                }

                Section("客户管理") {
                    Button {
                        activeForm = .newCustomer
                    } label: {
                        Label("新增客户", systemImage: "plus.circle.fill")
                    }

                    ForEach(customers) { customer in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(customer.name)
                                .font(.headline)
                            Text("\(customer.phone) · \(customer.lastOrderSummary)")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            activeForm = .editCustomer(customer)
                        }
                        .swipeActions {
                            Button("删除", role: .destructive) {
                                customers.removeAll { $0.id == customer.id }
                            }
                            Button("编辑") {
                                activeForm = .editCustomer(customer)
                            }
                            .tint(Color.brandOrange)
                        }
                    }
                }

                Section("库存管理") {
                    Picker("库存范围", selection: $inventoryFilter) {
                        ForEach(InventoryFilter.allCases) { filter in
                            Text(filter.rawValue).tag(filter)
                        }
                    }
                    .pickerStyle(.segmented)

                    Button {
                        activeForm = .newInventory
                    } label: {
                        Label("新增材料", systemImage: "plus.circle.fill")
                    }

                    ForEach(visibleInventoryItems) { item in
                        HStack(spacing: 12) {
                            VStack(alignment: .leading, spacing: 4) {
                                HStack(spacing: 6) {
                                    Text("\(item.name) · \(item.stockAmount)")
                                        .font(.headline)
                                    if item.isLowStock {
                                        Text("预警")
                                            .font(.caption2.weight(.bold))
                                            .padding(.horizontal, 6)
                                            .padding(.vertical, 2)
                                            .foregroundStyle(.white)
                                            .background(Color.brandOrange, in: Capsule())
                                    }
                                }
                                Text("\(item.warningLevel) · \(item.supplier)")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            Image(systemName: item.isLowStock ? "exclamationmark.triangle.fill" : "checkmark.circle")
                                .foregroundStyle(item.isLowStock ? Color.brandOrange : .green)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            activeForm = .editInventory(item)
                        }
                        .swipeActions {
                            Button("删除", role: .destructive) {
                                inventoryItems.removeAll { $0.id == item.id }
                            }
                            Button("编辑") {
                                activeForm = .editInventory(item)
                            }
                            .tint(Color.brandOrange)
                        }
                    }
                }

                Section("财务记录") {
                    Picker("流水范围", selection: $ledgerFilter) {
                        ForEach(LedgerFilter.allCases) { filter in
                            Text(filter.rawValue).tag(filter)
                        }
                    }
                    .pickerStyle(.segmented)

                    Button {
                        activeForm = .newLedger
                    } label: {
                        Label("新增流水", systemImage: "plus.circle.fill")
                    }

                    ForEach(visibleLedgerEntries) { entry in
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(entry.title)
                                    .font(.headline)
                                Text("\(entry.category) · \(dateText(entry.date))")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            Text(currency(entry.amount))
                                .foregroundStyle(entry.amount >= 0 ? .green : .red)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            activeForm = .editLedger(entry)
                        }
                        .swipeActions {
                            Button("删除", role: .destructive) {
                                ledgerEntries.removeAll { $0.id == entry.id }
                            }
                            Button("编辑") {
                                activeForm = .editLedger(entry)
                            }
                            .tint(Color.brandOrange)
                        }
                    }
                }
            }
            .navigationTitle("店铺日报")
            .toolbar {
                Menu {
                    Button("新增客户", systemImage: "person.badge.plus") {
                        activeForm = .newCustomer
                    }
                    Button("新增材料", systemImage: "shippingbox.badge.plus") {
                        activeForm = .newInventory
                    }
                    Button("新增流水", systemImage: "yensign.circle") {
                        activeForm = .newLedger
                    }
                } label: {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("新增记录")
            }
            .sheet(item: $activeForm) { form in
                switch form {
                case .newCustomer:
                    CustomerForm(modeTitle: "新增客户") { customer in
                        customers.insert(customer, at: 0)
                    }
                case .editCustomer(let customer):
                    CustomerForm(modeTitle: "编辑客户", customer: customer) { updatedCustomer in
                        replaceCustomer(updatedCustomer)
                    }
                case .newInventory:
                    InventoryForm(modeTitle: "新增材料") { item in
                        inventoryItems.insert(item, at: 0)
                    }
                case .editInventory(let item):
                    InventoryForm(modeTitle: "编辑材料", item: item) { updatedItem in
                        replaceInventoryItem(updatedItem)
                    }
                case .newLedger:
                    LedgerForm(modeTitle: "新增流水") { entry in
                        ledgerEntries.insert(entry, at: 0)
                    }
                case .editLedger(let entry):
                    LedgerForm(modeTitle: "编辑流水", entry: entry) { updatedEntry in
                        replaceLedgerEntry(updatedEntry)
                    }
                }
            }
        }
    }

    private func currency(_ value: Decimal) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "CNY"
        formatter.maximumFractionDigits = 0
        return formatter.string(from: value as NSDecimalNumber) ?? "¥0"
    }

    private func dateText(_ date: Date) -> String {
        if Calendar.current.isDateInToday(date) {
            return "今天"
        }

        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "zh_Hans_CN")
        formatter.dateFormat = "M月d日"
        return formatter.string(from: date)
    }

    private func replaceCustomer(_ customer: Customer) {
        guard let index = customers.firstIndex(where: { $0.id == customer.id }) else {
            return
        }
        customers[index] = customer
    }

    private func replaceInventoryItem(_ item: InventoryItem) {
        guard let index = inventoryItems.firstIndex(where: { $0.id == item.id }) else {
            return
        }
        inventoryItems[index] = item
    }

    private func replaceLedgerEntry(_ entry: LedgerEntry) {
        guard let index = ledgerEntries.firstIndex(where: { $0.id == entry.id }) else {
            return
        }
        ledgerEntries[index] = entry
    }
}

private enum ERPForm: Identifiable {
    case newCustomer
    case editCustomer(Customer)
    case newInventory
    case editInventory(InventoryItem)
    case newLedger
    case editLedger(LedgerEntry)

    var id: String {
        switch self {
        case .newCustomer:
            return "new-customer"
        case .editCustomer(let customer):
            return "edit-customer-\(customer.id)"
        case .newInventory:
            return "new-inventory"
        case .editInventory(let item):
            return "edit-inventory-\(item.id)"
        case .newLedger:
            return "new-ledger"
        case .editLedger(let entry):
            return "edit-ledger-\(entry.id)"
        }
    }
}

private enum LedgerFilter: String, CaseIterable, Identifiable {
    case today = "今天"
    case all = "全部"

    var id: Self { self }
}

private enum InventoryFilter: String, CaseIterable, Identifiable {
    case all = "全部"
    case lowStock = "预警"

    var id: Self { self }
}

private struct DailyReportHeader: View {
    var revenue: String
    var cost: String
    var netCashflow: String

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Label("今日经营", systemImage: "sun.max.fill")
                    .font(.headline)
                    .foregroundStyle(Color.brandRed)
                Spacer()
                Text("沙县小吃")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.secondary)
            }

            Text(netCashflow)
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
                .foregroundStyle(.primary)
                .accessibilityLabel("今日净流水 \(netCashflow)")

            HStack(spacing: 12) {
                ReportPill(title: "收入", value: revenue, color: .green)
                ReportPill(title: "材料成本", value: cost, color: Color.brandOrange)
            }
        }
        .padding(.vertical, 8)
    }
}

private struct CustomerForm: View {
    @Environment(\.dismiss) private var dismiss
    var modeTitle: String
    var customer: Customer?
    @State private var name = ""
    @State private var phone = ""
    @State private var lastOrderSummary = ""
    @State private var totalSpend = ""
    var onSave: (Customer) -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section("客户信息") {
                    TextField("客户名称", text: $name)
                    TextField("手机号", text: $phone)
                        .keyboardType(.phonePad)
                    TextField("最近消费", text: $lastOrderSummary)
                    TextField("累计消费", text: $totalSpend)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle(modeTitle)
            .onAppear {
                guard let customer else { return }
                name = customer.name
                phone = customer.phone
                lastOrderSummary = customer.lastOrderSummary
                totalSpend = currencyInput(customer.totalSpend)
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("取消") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("保存") {
                        onSave(Customer(
                            id: customer?.id ?? UUID(),
                            name: name.trimmingCharacters(in: .whitespacesAndNewlines),
                            phone: phone.trimmingCharacters(in: .whitespacesAndNewlines),
                            lastOrderSummary: lastOrderSummary.trimmingCharacters(in: .whitespacesAndNewlines),
                            totalSpend: decimal(totalSpend)
                        ))
                        dismiss()
                    }
                    .disabled(name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
}

private struct InventoryForm: View {
    @Environment(\.dismiss) private var dismiss
    var modeTitle: String
    var item: InventoryItem?
    @State private var name = ""
    @State private var stockAmount = ""
    @State private var warningLevel = ""
    @State private var supplier = ""
    @State private var isLowStock = false
    var onSave: (InventoryItem) -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section("材料库存") {
                    TextField("材料名称", text: $name)
                    TextField("当前余量，例如 8 袋", text: $stockAmount)
                    TextField("补货提醒，例如 低于 6 袋提醒", text: $warningLevel)
                    TextField("供应商", text: $supplier)
                    Toggle("标记为需要补货", isOn: $isLowStock)
                }
            }
            .navigationTitle(modeTitle)
            .onAppear {
                guard let item else { return }
                name = item.name
                stockAmount = item.stockAmount
                warningLevel = item.warningLevel
                supplier = item.supplier
                isLowStock = item.isLowStock
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("取消") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("保存") {
                        onSave(InventoryItem(
                            id: item?.id ?? UUID(),
                            name: name.trimmingCharacters(in: .whitespacesAndNewlines),
                            stockAmount: stockAmount.trimmingCharacters(in: .whitespacesAndNewlines),
                            warningLevel: warningLevel.trimmingCharacters(in: .whitespacesAndNewlines),
                            supplier: supplier.trimmingCharacters(in: .whitespacesAndNewlines),
                            isLowStock: isLowStock
                        ))
                        dismiss()
                    }
                    .disabled(name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
}

private struct LedgerForm: View {
    @Environment(\.dismiss) private var dismiss
    var modeTitle: String
    var entry: LedgerEntry?
    @State private var title = ""
    @State private var amount = ""
    @State private var category = "收入"
    @State private var isExpense = false
    @State private var date = Date()
    var onSave: (LedgerEntry) -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section("流水信息") {
                    TextField("事项，例如 晚市流水", text: $title)
                    TextField("金额", text: $amount)
                        .keyboardType(.decimalPad)
                    Picker("类型", selection: $isExpense) {
                        Text("收入").tag(false)
                        Text("支出").tag(true)
                    }
                    .pickerStyle(.segmented)
                    TextField("分类", text: $category)
                    DatePicker("日期", selection: $date, displayedComponents: .date)
                }
            }
            .navigationTitle(modeTitle)
            .onAppear {
                guard let entry else { return }
                title = entry.title
                amount = currencyInput(abs(entry.amount))
                category = entry.category
                isExpense = entry.amount < 0
                date = entry.date
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("取消") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("保存") {
                        var value = decimal(amount)
                        if isExpense {
                            value = -abs(value)
                        }
                        onSave(LedgerEntry(
                            id: entry?.id ?? UUID(),
                            title: title.trimmingCharacters(in: .whitespacesAndNewlines),
                            amount: value,
                            category: category.trimmingCharacters(in: .whitespacesAndNewlines),
                            date: date
                        ))
                        dismiss()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || decimal(amount) == 0)
                }
            }
        }
    }
}

private func decimal(_ text: String) -> Decimal {
    Decimal(string: text.trimmingCharacters(in: .whitespacesAndNewlines)) ?? 0
}

private func currencyInput(_ value: Decimal) -> String {
    let number = NSDecimalNumber(decimal: value)
    return number.stringValue
}

private struct ReportPill: View {
    var title: String
    var value: String
    var color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(value)
                .font(.headline)
                .foregroundStyle(color)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct MetricRow: View {
    var title: String
    var value: String
    var subtitle: String
    var systemImage: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: systemImage)
                .font(.title3.weight(.semibold))
                .foregroundStyle(Color.brandRed)
                .frame(width: 32)

            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.headline)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text(value)
                .font(.system(.title3, design: .rounded, weight: .bold))
                .foregroundStyle(Color.brandRed)
        }
        .padding(.vertical, 4)
    }
}
