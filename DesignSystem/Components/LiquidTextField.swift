import SwiftUI

struct LiquidTextField: View {

    let title: String

    @Binding var text: String

    var body: some View {

        TextField(title, text: $text)

            .padding(18)

            .liquidGlass(
                .toolbar,
                cornerRadius: AppRadius.large
            )

    }

}