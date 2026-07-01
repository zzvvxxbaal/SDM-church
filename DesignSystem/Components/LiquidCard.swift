import SwiftUI

struct LiquidCard<Content: View>: View {

    @ViewBuilder

    let content: Content

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            content

        }

        .padding(24)

        .frame(maxWidth: .infinity)

        .liquidGlass(.card, cornerRadius: AppRadius.card)

    }

}