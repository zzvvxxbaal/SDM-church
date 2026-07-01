import SwiftUI

struct LiquidDialog<Content: View>: View {

    @ViewBuilder

    let content: Content

    var body: some View {

        VStack(spacing:20) {

            content

        }

        .padding(28)

        .liquidGlass(.thick, cornerRadius: AppRadius.dialog)

    }

}