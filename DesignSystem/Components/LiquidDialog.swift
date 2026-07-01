import SwiftUI

struct LiquidDialog<Content: View>: View {

    @ViewBuilder

    let content: Content

    var body: some View {

        VStack(spacing: AppSpacing.inset) {

            content

        }

        .padding(AppSpacing.floating)

        .liquidGlass(.thick, cornerRadius: AppRadius.dialog)

    }

}