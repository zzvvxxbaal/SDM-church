import SwiftUI

struct LiquidBadge: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.caption.weight(.semibold))
            .lineLimit(1)
            .minimumScaleFactor(0.8)
            .padding(.horizontal, AppSpacing.compact)
            .padding(.vertical, AppSpacing.smWide)
            .liquidGlass(.capsule, cornerRadius: AppRadius.xs)
            .accessibilityElement(children: .combine)
            .accessibilityLabel(title)
    }
}
