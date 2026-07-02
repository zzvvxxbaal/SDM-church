import SwiftUI

struct LiquidSecureField: View {

    let title: String

    @Binding var text: String

    var body: some View {

        SecureField(title, text: $text)

            .padding(18)

            .liquidGlass(
                .toolbar,
                cornerRadius: AppRadius.large
            )

    }

}