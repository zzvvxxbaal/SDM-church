import SwiftUI

struct CalendarMonthHeader: View {
    var body: some View {
        HStack {
            Text("2026년 7월")
                .font(.largeTitle.bold())
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .accessibilityAddTraits(.isHeader)

            Spacer()

            LiquidIconButton(
                systemImage: "chevron.left",
                accessibilityLabel: "이전 달",
                accessibilityHint: "이전 달 일정으로 이동합니다"
            ) {
            }

            LiquidIconButton(
                systemImage: "chevron.right",
                accessibilityLabel: "다음 달",
                accessibilityHint: "다음 달 일정으로 이동합니다"
            ) {
            }
        }
    }
}
