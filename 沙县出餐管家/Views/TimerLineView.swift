import SwiftUI

struct TimerLineView: View {
    var line: KitchenLine
    var orders: [KitchenOrder]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Label {
                    Text(LocalizedStringKey(line.rawValue))
                } icon: {
                    Image(systemName: line.iconName)
                }
                    .font(.headline)
                Spacer()
                Text("\(orders.count) 单")
                    .font(.caption.weight(.bold))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color(.secondarySystemGroupedBackground), in: Capsule())
            }

            if orders.isEmpty {
                Text("当前没有排队，出餐口空闲。")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 12)
            } else {
                ForEach(orders) { order in
                    OrderTimerRow(order: order)
                }
            }
        }
        .padding(16)
        .background(Color(.systemBackground), in: RoundedRectangle(cornerRadius: 22, style: .continuous))
    }
}

private struct OrderTimerRow: View {
    var order: KitchenOrder

    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading, spacing: 3) {
                    Text(LocalizedStringKey(order.tableName))
                        .font(.headline)
                    Text(LocalizedStringKey(order.itemName)) + Text(" x\(order.quantity)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                Text(order.isReady ? "可上菜" : timeText(order.remainingSeconds))
                    .font(.system(.title3, design: .rounded, weight: .bold))
                    .foregroundStyle(order.isReady ? Color.green : Color.brandRed)
                    .monospacedDigit()
            }

            ProgressView(value: order.progress)
                .tint(order.isReady ? Color.green : Color.brandOrange)
        }
        .padding(14)
        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private func timeText(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let remainder = seconds % 60
        return String(format: "%02d:%02d", minutes, remainder)
    }
}
