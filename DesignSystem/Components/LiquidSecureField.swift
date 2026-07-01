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
                .accessibilityHidden(true)

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
            .accessibilityHint("\(title) 값을 입력합니다")

            Button {
                withAnimation(.snappy) {
                    isSecure.toggle()
                }
            } label: {
                Image(systemName: isSecure ? "eye.slash" : "eye")
                    .foregroundStyle(AppColors.textSecondary)
                    .accessibilityHidden(true)
            }
            .buttonStyle(.plain)
            .accessibilityLabel(isSecure ? "비밀번호 보기" : "비밀번호 숨기기")
            .accessibilityHint("비밀번호 표시 상태를 전환합니다")
            .accessibilityAddTraits(.isButton)
        }
        .padding(.horizontal, AppSpacing.controlInset)
        .frame(height: 60)
        .liquidGlass(.regular, cornerRadius: AppRadius.button)
        .accessibilityElement(children: .contain)
    }
}

#Preview {
    @Previewable @State var password = ""

    LiquidSecureField(
        title: "비밀번호",
        text: $password
    )
}
