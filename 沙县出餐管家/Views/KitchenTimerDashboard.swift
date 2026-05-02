import SwiftUI

struct KitchenTimerDashboard: View {
    @Binding var orders: [KitchenOrder]
    @State private var now = Date()

    private let ticker = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    HeaderCard(activeCount: orders.filter { !$0.isReady }.count)

                    ForEach(KitchenLine.allCases) { line in
                        TimerLineView(
                            line: line,
                            orders: orders
                                .filter { $0.line == line }
                                .sorted { $0.dueAt < $1.dueAt }
                        )
                    }
                }
                .padding(18)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("三线出餐")
            .toolbar {
                Button {
                    addDemoOrder()
                } label: {
                    Label("新增", systemImage: "plus")
                }
            }
            .onReceive(ticker) { value in
                now = value
            }
        }
    }

    private func addDemoOrder() {
        let line = KitchenLine.allCases.randomElement() ?? .dumplings
        let item: String
        switch line {
        case .dumplings:
            item = "蒸饺"
        case .noodles:
            item = "沙县拌面"
        case .stew:
            item = "乌鸡炖罐"
        }

        orders.append(
            KitchenOrder(
                id: UUID(),
                tableName: "\(Int.random(in: 1...12))号桌",
                line: line,
                itemName: item,
                quantity: Int.random(in: 1...3),
                startedAt: now,
                dueAt: now.addingTimeInterval(TimeInterval(line.defaultMinutes * 60))
            )
        )
    }
}

private struct HeaderCard: View {
    var activeCount: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("蒸饺 / 拌面 / 炖罐")
                .font(.system(.title2, design: .rounded, weight: .bold))
            Text("同时盯住三个出餐口，先到点的桌号会自动排在前面。")
                .foregroundStyle(.secondary)
            HStack {
                Label("\(activeCount) 单制作中", systemImage: "flame.fill")
                Spacer()
                Text("高峰期模式")
                    .font(.caption.weight(.semibold))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(Color.brandYellow.opacity(0.25), in: Capsule())
            }
            .font(.subheadline.weight(.medium))
        }
        .padding(18)
        .background(
            LinearGradient(
                colors: [Color.brandRed, Color.brandOrange],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .shadow(color: Color.brandRed.opacity(0.22), radius: 18, y: 10)
    }
}
