import SwiftUI

struct LiquidSearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack(spacing: AppSpacing.medium) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(AppColors.textSecondary)

            TextField("검색", text: $text)
                .font(.body)
                .accessibilityLabel("Search")
                .accessibilityHint("Filters the current list")
        }
        .padding(.horizontal, AppSpacing.controlInset)
        .frame(height: 56)
        .liquidGlass(.toolbar, cornerRadius: AppRadius.small)
    }
}

#Preview {
    @Previewable @State var search = ""

    LiquidSearchBar(text: $search)
}
