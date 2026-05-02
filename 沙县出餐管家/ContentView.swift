import SwiftUI

struct ContentView: View {
    private enum AppTab: Hashable {
        case report
        case kitchen
    }

    @State private var selectedTab: AppTab
    @State private var orders = SampleData.orders
    @State private var customers = SampleData.customers
    @State private var inventoryItems = SampleData.inventoryItems
    @State private var ledgerEntries = SampleData.ledgerEntries
    private let storeKey = "store-snapshot-v1"
    private let screenshotMode: Int

    init() {
        let mode = UserDefaults.standard.integer(forKey: "ScreenshotMode")
        screenshotMode = mode
        _selectedTab = State(initialValue: mode == 2 ? .kitchen : .report)
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            ERPOverviewView(
                customers: $customers,
                inventoryItems: $inventoryItems,
                ledgerEntries: $ledgerEntries
            )
                .tabItem {
                    Label("日报", systemImage: "chart.line.uptrend.xyaxis")
                }
                .tag(AppTab.report)

            KitchenTimerDashboard(orders: $orders)
                .tabItem {
                    Label("出餐", systemImage: "timer")
                }
                .tag(AppTab.kitchen)
        }
        .tint(Color.brandRed)
        .onAppear(perform: loadSnapshot)
        .onChange(of: customers) { _, _ in
            saveSnapshot()
        }
        .onChange(of: inventoryItems) { _, _ in
            saveSnapshot()
        }
        .onChange(of: ledgerEntries) { _, _ in
            saveSnapshot()
        }
    }

    private func loadSnapshot() {
        guard screenshotMode == 0 else {
            return
        }

        guard
            let data = UserDefaults.standard.data(forKey: storeKey),
            let snapshot = try? JSONDecoder().decode(StoreSnapshot.self, from: data)
        else {
            return
        }

        customers = snapshot.customers
        inventoryItems = snapshot.inventoryItems
        ledgerEntries = snapshot.ledgerEntries
    }

    private func saveSnapshot() {
        guard screenshotMode == 0 else {
            return
        }

        let snapshot = StoreSnapshot(
            customers: customers,
            inventoryItems: inventoryItems,
            ledgerEntries: ledgerEntries
        )
        guard let data = try? JSONEncoder().encode(snapshot) else {
            return
        }
        UserDefaults.standard.set(data, forKey: storeKey)
    }
}

#Preview {
    ContentView()
}
