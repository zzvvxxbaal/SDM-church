import SwiftUI

struct LiquidSecureField: View {

    let title: String

    @Binding
    var text: String

    @State
    private var isSecure = true

    var body: some View {

        HStack(spacing: AppSpacing.medium) {

            Image(systemName: "lock")
                .font(.title3)
                .foregroundStyle(.secondary)
                .frame(width: 22)

            Group {

                if isSecure {

                    SecureField(title, text: $text)

                } else {

                    TextField(title, text: $text)

                }

            }

            Button {

                withAnimation(.snappy) {

                    isSecure.toggle()

                }

            } label: {

                Image(systemName: isSecure ? "eye.slash" : "eye")

            }

            .foregroundStyle(.secondary)

        }

        .padding(.horizontal, 22)
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