import SwiftUI

struct LiquidListRow<Content: View>: View {

    @ViewBuilder

    let content: Content

    var body: some View {

        HStack {

            content

            Spacer()

            Image(systemName: "chevron.right")

                .foregroundStyle(.tertiary)

        }

        .padding(20)

        .liquidGlass(.card, cornerRadius: AppRadius.card)

    }

}