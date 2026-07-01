import SwiftUI

struct SummaryStatistic: Identifiable {
    let id: String
    let icon: String
    let title: String
    let value: String
    let subtitle: String
    let color: Color
}

struct PersonalizedSummarySection: View {
    let statistics: [SummaryStatistic]
    
    init(statistics: [SummaryStatistic]? = nil) {
        self.statistics = statistics ?? [
            SummaryStatistic(
                id: "1",
                icon: "checkmark.circle.fill",
                title: "이번 달 출석",
                value: "4",
                subtitle: "/ 5회",
                color: .blue
            ),
            SummaryStatistic(
                id: "2",
                icon: "hands.sparkles.fill",
                title: "기도 횟수",
                value: "23",
                subtitle: "회",
                color: .pink
            ),
            SummaryStatistic(
                id: "3",
                icon: "calendar",
                title: "참석 행사",
                value: "8",
                subtitle: "개",
                color: .green
            ),
            SummaryStatistic(
                id: "4",
                icon: "star.fill",
                title: "봉사 시간",
                value: "12",
                subtitle: "시간",
                color: .orange
            ),
        ]
    }
    
    var body: some View {
        AppleSection(
            title: "이번 주 정리",
            subtitle: "6월 30일 - 7월 6일",
            icon: "square.and.pencil",
            size: .large
        ) {
            VStack(spacing: AppSpacing.medium) {
                HStack(spacing: AppSpacing.medium) {
                    SummaryStatisticCard(statistic: statistics[0])
                    SummaryStatisticCard(statistic: statistics[1])
                }
                
                HStack(spacing: AppSpacing.medium) {
                    SummaryStatisticCard(statistic: statistics[2])
                    SummaryStatisticCard(statistic: statistics[3])
                }
            }
            .padding(.horizontal, AppSpacing.large)
        }
    }
}

struct SummaryStatisticCard: View {
    let statistic: SummaryStatistic
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            HStack(spacing: AppSpacing.small) {
                Image(systemName: statistic.icon)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(statistic.color)
                
                Text(statistic.title)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
            
            HStack(alignment: .firstTextBaseline, spacing: 2) {
                Text(statistic.value)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(statistic.color)
                
                Text(statistic.subtitle)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 120)
        .padding(AppSpacing.medium)
        .liquidGlass(.card, cornerRadius: AppRadius.card)
    }
}

#Preview {
    PersonalizedSummarySection()
        .padding()
}
