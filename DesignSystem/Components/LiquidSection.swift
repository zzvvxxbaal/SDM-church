import SwiftUI

struct LiquidSection<Content: View>: View {

    let title: String

    @ViewBuilder

    let content: Content

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 18
        ) {

            Text(title)

                .font(AppFonts.title3)

                .fontWeight(.bold)

                .padding(.horizontal, 4)

            content

        }

        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )

    }

}
