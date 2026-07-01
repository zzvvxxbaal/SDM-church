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

            TextField(title, text: $text)
                .font(.body)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .accessibilityLabel(title)
                .accessibilityHint("Enter your \(title)")
        }
        .padding(.horizontal, AppSpacing.controlInset)
        .frame(height: 60)
        .liquidGlass(.regular, cornerRadius: AppRadius.button)
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
