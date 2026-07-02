import SwiftUI

struct LiquidSearchBar: View {

    @Binding
    var text: String

    var placeholder: String = "검색"

    var body: some View {

        HStack(spacing: AppSpacing.medium) {

            Image(systemName: "magnifyingglass")
                .font(.headline)
                .foregroundStyle(AppColors.textSecondary)
                .accessibilityHidden(true)

            TextField(
                placeholder,
                text: $text
            )
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .font(AppFonts.body)

            if !text.isEmpty {

                Button {

                    text = ""

                } label: {

                    Image(systemName: "xmark.circle.fill")
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(AppColors.textSecondary)

                }
                .buttonStyle(.plain)

            }

        }

        .padding(.horizontal, AppSpacing.large)

        .frame(height: 56)

        .liquidGlass(
            .toolbar,
            cornerRadius: AppRadius.full
        )

        .accessibilityElement(children: .contain)

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        LiquidSearchBar(
            text: .constant("")
        )
        .padding()

    }

}