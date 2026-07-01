import SwiftUI

struct QuickActionsSection: View {
    let onPrayerTap: (() -> Void)?
    let onGivingTap: (() -> Void)?
    let onGroupTap: (() -> Void)?
    let onVolunteerTap: (() -> Void)?
    
    var body: some View {
        AppleSection(
            title: "빠른 메뉴",
            icon: "square.grid.2x2.fill",
            size: .medium
        ) {
            VStack(spacing: AppSpacing.medium) {
                HStack(spacing: AppSpacing.medium) {
                    QuickActionButton(
                        icon: "hands.sparkles.fill",
                        title: "기도",
                        action: onPrayerTap
                    )
                    
                    QuickActionButton(
                        icon: "dollarsign.circle.fill",
                        title: "헌금",
                        action: onGivingTap
                    )
                }
                
                HStack(spacing: AppSpacing.medium) {
                    QuickActionButton(
                        icon: "person.3.fill",
                        title: "소그룹",
                        action: onGroupTap
                    )
                    
                    QuickActionButton(
                        icon: "heart.fill",
                        title: "봉사",
                        action: onVolunteerTap
                    )
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
    
    var body: some View {
        Button(action: { action?() }) {
            VStack(spacing: AppSpacing.medium) {
                Image(systemName: icon)
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundStyle(AppColors.tint)
                
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .liquidGlass(.card, cornerRadius: AppRadius.card)
            .pressAnimation(pressed: false, scale: 0.95, rotation: 0)
        }
    }
}

#Preview {
    QuickActionsSection()
        .padding()
}
