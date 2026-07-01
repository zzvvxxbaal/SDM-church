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
    private static let defaultStatistics = [
        SummaryStatistic(id: "1", icon: "checkmark.circle.fill", title: "이번 달 출석", value: "4", subtitle: "/ 5회", color: .blue),
        SummaryStatistic(id: "2", icon: "hands.sparkles.fill", title: "기도 횟수", value: "23", subtitle: "회", color: .pink),
        SummaryStatistic(id: "3", icon: "calendar", title: "참석 행사", value: "8", subtitle: "개", color: .green),
        SummaryStatistic(id: "4", icon: "star.fill", title: "봉사 시간", value: "12", subtitle: "시간", color: .orange)
    ]

    let statistics: [SummaryStatistic]

    init(statistics: [SummaryStatistic]? = nil) {
        self.statistics = statistics ?? Self.defaultStatistics
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
                    .font(AppFonts.headline)
                    .foregroundStyle(statistic.color)
                    .accessibilityHidden(true)

                Text(statistic.title)
                    .font(AppFonts.caption1)
                    .foregroundStyle(AppColors.textSecondary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }

            HStack(alignment: .firstTextBaseline, spacing: AppSpacing.xxs) {
                Text(statistic.value)
                    .font(AppFonts.title2)
                    .foregroundStyle(statistic.color)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)

                Text(statistic.subtitle)
                    .font(AppFonts.caption1)
                    .foregroundStyle(AppColors.textSecondary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: AppSpacing.section * 2 + AppSpacing.large, alignment: .leading)
        .padding(AppSpacing.medium)
        .liquidGlass(.card, cornerRadius: AppRadius.card)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(statistic.title)
        .accessibilityValue("\(statistic.value)\(statistic.subtitle)")
    }
}

#Preview {
    PersonalizedSummarySection()
        .padding()
}
