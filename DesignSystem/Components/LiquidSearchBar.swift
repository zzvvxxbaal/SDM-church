import SwiftUI

struct LiquidSearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack(spacing: AppSpacing.medium) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(AppColors.textSecondary)
                .accessibilityHidden(true)

            TextField("검색", text: $text)
                .font(.body)
                .accessibilityLabel("검색")
                .accessibilityHint("현재 목록을 필터링합니다")
        }
        .padding(.horizontal, AppSpacing.controlInset)
        .frame(height: 56)
        .liquidGlass(.toolbar, cornerRadius: AppRadius.small)
        .accessibilityElement(children: .contain)
    }
}

#Preview {
    @Previewable @State var search = ""

    LiquidSearchBar(text: $search)
}
