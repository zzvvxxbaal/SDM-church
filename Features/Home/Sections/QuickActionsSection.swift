import SwiftUI

struct QuickActionsSection: View {
    let onPrayerTap: (() -> Void)?
    let onGivingTap: (() -> Void)?
    let onGroupTap: (() -> Void)?
    let onVolunteerTap: (() -> Void)?

    var body: some View {
        AppleSection(title: "빠른 메뉴", icon: "square.grid.2x2.fill", size: .medium) {
            VStack(spacing: AppSpacing.medium) {
                HStack(spacing: AppSpacing.medium) {
                    QuickActionButton(icon: "hands.sparkles.fill", title: "기도", action: onPrayerTap)
                    QuickActionButton(icon: "dollarsign.circle.fill", title: "헌금", action: onGivingTap)
                }

                HStack(spacing: AppSpacing.medium) {
                    QuickActionButton(icon: "person.3.fill", title: "소그룹", action: onGroupTap)
                    QuickActionButton(icon: "heart.fill", title: "봉사", action: onVolunteerTap)
                }
            }
            .padding(.horizontal, AppSpacing.large)
        }
    }
}

private struct QuickActionButton: View {
    let icon: String
    let title: String
    let action: (() -> Void)?

    @State private var isPressed = false

    var body: some View {
        Button(action: { action?() }) {
            VStack(spacing: AppSpacing.medium) {
                Image(systemName: icon)
                    .font(AppFonts.title)
                    .foregroundStyle(AppColors.tint)
                    .accessibilityHidden(true)

                Text(title)
                    .font(.subheadline.weight(.semibold))
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .liquidGlass(.card, cornerRadius: AppRadius.card)
            .buttonPress(isPressed: isPressed, scale: 0.95, opacity: 0.85, hapticFeedback: true)
        }
        .onTouchDown { isPressed = true }
        .onTouchUp { isPressed = false }
        .accessibilityLabel(title)
        .accessibilityHint("\(title) 화면을 엽니다")
        .accessibilityAddTraits(.isButton)
    }
}

#Preview {
    QuickActionsSection()
        .padding()
}
