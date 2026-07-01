import SwiftUI

struct ActivityItem: Identifiable {
    let id: String
    let icon: String
    let title: String
    let description: String
    let date: String
    let color: Color
}

struct RecentActivitySection: View {
    let activities: [ActivityItem]
    let onActivityTap: ((ActivityItem) -> Void)?
    
    init(
        activities: [ActivityItem]? = nil,
        onActivityTap: ((ActivityItem) -> Void)? = nil
    ) {
        self.activities = activities ?? [
            ActivityItem(
                id: "1",
                icon: "checkmark.circle.fill",
                title: "예배 참석",
                description: "지난 주일 예배에 참석했습니다.",
                date: "3일 전",
                color: .green
            ),
            ActivityItem(
                id: "2",
                icon: "heart.fill",
                title: "기도 답변",
                description: "당신의 기도가 응답되었습니다.",
                date: "5일 전",
                color: .pink
            ),
            ActivityItem(
                id: "3",
                icon: "star.fill",
                title: "찬양팀 참여",
                description: "찬양팀 연습에 참석했습니다.",
                date: "1주일 전",
                color: .yellow
            ),
            ActivityItem(
                id: "4",
                icon: "book.fill",
                title: "말씀 읽음",
                description: "오늘의 말씀을 읽었습니다.",
                date: "오늘",
                color: .blue
            ),
        ]
        self.onActivityTap = onActivityTap
    }
    
    var body: some View {
        AppleSection(
            title: "최근 활동",
            icon: "clock.fill",
            size: .large,
            showSeeAll: true
        ) {
            VStack(spacing: AppSpacing.medium) {
                ForEach(activities) { activity in
                    Button(action: { onActivityTap?(activity) }) {
                        ActivityCard(activity: activity)
                    }
                }
            }
            .padding(.horizontal, AppSpacing.large)
        }
    }
}

struct ActivityCard: View {
    let activity: ActivityItem
    
    var body: some View {
        HStack(spacing: AppSpacing.medium) {
            Image(systemName: activity.icon)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.white)
                .frame(width: 44, height: 44)
                .background(activity.color)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(activity.title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(.primary)
                
                Text(activity.description)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
            
            Spacer()
            
            Text(activity.date)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.secondary)
        }
        .padding(AppSpacing.medium)
        .liquidGlass(.card, cornerRadius: AppRadius.card)
    }
}

#Preview {
    RecentActivitySection()
        .padding()
}
