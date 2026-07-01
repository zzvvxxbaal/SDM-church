import SwiftUI

struct LiquidSearchBar: View {

    @Binding
    var text: String

    var body: some View {

        HStack(spacing: AppSpacing.medium) {

            Image(systemName: "magnifyingglass")

            TextField("검색", text: $text)

        }

        .padding(.horizontal,22)

        .frame(height:56)

        .liquidGlass(.toolbar, cornerRadius: AppRadius.small)

    }

}

#Preview {

    @Previewable @State var search = ""

    LiquidSearchBar(text: $search)

}