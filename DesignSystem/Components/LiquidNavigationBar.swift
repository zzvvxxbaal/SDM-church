import SwiftUI

struct LiquidNavigationBar: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(AppFonts.title)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .accessibilityAddTraits(.isHeader)

            Spacer()

            Image(systemName: "bell")
                .font(.title3)
                .accessibilityLabel("알림")
        }
        .padding(.horizontal, AppSpacing.large)
        .frame(height: 64)
        .liquidGlass(.navigation, cornerRadius: AppRadius.sheet)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(title)
    }
}

#Preview {
    LiquidNavigationBar(title: "홈")
}
