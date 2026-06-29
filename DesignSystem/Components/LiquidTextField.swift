import SwiftUI

struct LiquidTextField: View {

    let title: String

    @Binding
    var text: String

    var systemImage: String

    var body: some View {

        HStack(spacing: AppSpacing.medium) {

            Image(systemName: systemImage)
                .font(.title3)
                .foregroundStyle(.secondary)
                .frame(width: 22)

            TextField(title, text: $text)
                .font(AppFonts.body)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()

        }

        .padding(.horizontal, 22)
        .frame(height: 60)
        .glass()

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