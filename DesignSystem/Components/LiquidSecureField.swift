import SwiftUI

struct LiquidSecureField: View {
    let title: String
    @Binding var text: String
    @State private var isSecure = true

    var body: some View {
        HStack(spacing: AppSpacing.medium) {
            Image(systemName: "lock")
                .font(.title3)
                .foregroundStyle(AppColors.textSecondary)
                .frame(width: AppSpacing.controlInset)

            Group {
                if isSecure {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                }
            }
            .font(.body)
            .accessibilityLabel(title)
            .accessibilityHint("Enter your \(title)")

            Button {
                withAnimation(.snappy) {
                    isSecure.toggle()
                }
            } label: {
                Image(systemName: isSecure ? "eye.slash" : "eye")
                    .foregroundStyle(AppColors.textSecondary)
            }
            .buttonStyle(.plain)
            .accessibilityLabel(isSecure ? "Show password" : "Hide password")
            .accessibilityHint("Toggles password visibility")
        }
        .padding(.horizontal, AppSpacing.controlInset)
        .frame(height: 60)
        .liquidGlass(.regular, cornerRadius: AppRadius.button)
    }
}

#Preview {
    @Previewable @State var password = ""

    LiquidSecureField(
        title: "비밀번호",
        text: $password
    )
}
