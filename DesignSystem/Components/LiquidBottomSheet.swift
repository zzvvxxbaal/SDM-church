import SwiftUI

struct LiquidBottomSheet<Content: View>: View {

    @ViewBuilder

    let content: Content

    var body: some View {

        VStack {

            Capsule()

                .fill(.secondary.opacity(0.4))

                .frame(width:44,height:5)

                .padding(.top, AppSpacing.compact)

            content

        }

        .padding(AppSpacing.large)

        .liquidGlass(.thick, cornerRadius: AppRadius.sheet)

    }

}