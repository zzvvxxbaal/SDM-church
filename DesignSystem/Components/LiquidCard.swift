import SwiftUI

struct LiquidCard<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            content
        }
        .padding(AppSpacing.large)
        .frame(maxWidth: .infinity)
        .liquidGlass(.card, cornerRadius: AppRadius.card)
        .accessibilityElement(children: .combine)
    }
}
