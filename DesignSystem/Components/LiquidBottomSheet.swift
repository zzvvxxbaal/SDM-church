import SwiftUI

struct LiquidBottomSheet<Content: View>: View {

    @ViewBuilder

    let content: Content

    var body: some View {

        VStack {

            Capsule()

                .fill(.secondary.opacity(0.4))

                .frame(width:44,height:5)

                .padding(.top,12)

            content

        }

        .padding(24)

        .liquidGlass(.thick, cornerRadius: AppRadius.sheet)

    }

}