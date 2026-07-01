import SwiftUI

struct FloatingGlassTabBar<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        HStack {
            content
        }
        .padding(.horizontal, AppSpacing.large)
        .padding(.vertical, AppSpacing.compact)
        .liquidGlass(.floating, cornerRadius: AppRadius.floating)
        .shadow(
            color: AppColors.glassShadow,
            radius: 35,
            y: 18
        )
    }
}
