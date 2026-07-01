import SwiftUI

struct LiquidTabBar: View {
    @Binding var selection: Int

    var body: some View {
        HStack {
            tab(image: "house.fill", title: "홈", index: 0)
            Spacer()
            tab(image: "calendar", title: "달력", index: 1)
            Spacer()
            tab(image: "hands.sparkles.fill", title: "기도", index: 2)
            Spacer()
            tab(image: "person.3.fill", title: "공동체", index: 3)
            Spacer()
            tab(image: "gearshape.fill", title: "설정", index: 4)
        }
        .padding(.horizontal, AppSpacing.floating)
        .frame(height: 70)
        .liquidGlass(.navigation, cornerRadius: AppRadius.sheet)
    }

    @ViewBuilder
    private func tab(
        image: String,
        title: String,
        index: Int
    ) -> some View {
        Button {
            selection = index
        } label: {
            Image(systemName: image)
                .font(.title3)
                .foregroundStyle(selection == index ? AppColors.tint : AppColors.textSecondary)
                .accessibilityHidden(true)
        }
        .accessibilityLabel(title)
        .accessibilityHint("\(title) 화면을 엽니다")
        .accessibilityAddTraits(.isButton)
    }
}

#Preview {

    @Previewable @State var tab = 0

    LiquidTabBar(selection: $tab)

}