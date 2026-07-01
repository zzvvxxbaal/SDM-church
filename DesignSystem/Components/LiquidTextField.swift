import SwiftUI

struct LiquidTextField: View {
    let title: String
    @Binding var text: String
    var systemImage: String

    var body: some View {
        HStack(spacing: AppSpacing.medium) {
            Image(systemName: systemImage)
                .font(.title3)
                .foregroundStyle(AppColors.textSecondary)
                .frame(width: AppSpacing.controlInset)
                .accessibilityHidden(true)

            TextField(title, text: $text)
                .font(.body)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .accessibilityLabel(title)
                .accessibilityHint("\(title) 값을 입력합니다")
        }
        .padding(.horizontal, AppSpacing.controlInset)
        .frame(height: 60)
        .liquidGlass(.regular, cornerRadius: AppRadius.button)
        .accessibilityElement(children: .contain)
    }
}

#Preview {
    @Previewable @State var text = ""

    LiquidTextField(
        title: "이메일",
        text: $text,
        systemImage: "envelope"
    )
}
