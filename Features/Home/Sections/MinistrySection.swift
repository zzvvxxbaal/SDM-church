import SwiftUI

struct MinistryData: Identifiable {
    let id: String
    let name: String
    let leader: String
    let icon: String
    let color: Color
    let memberCount: Int
}

struct MinistrySection: View {
    private static let defaultMinistries = [
        MinistryData(id: "1", name: "찬양팀", leader: "정현석", icon: "music.note.list", color: .blue, memberCount: 12),
        MinistryData(id: "2", name: "수호팀", leader: "김철수", icon: "eye.fill", color: .purple, memberCount: 8),
        MinistryData(id: "3", name: "중보기도", leader: "이순신", icon: "hands.sparkles.fill", color: .pink, memberCount: 15),
        MinistryData(id: "4", name: "교육팀", leader: "박민준", icon: "books.vertical.fill", color: .green, memberCount: 10)
    ]

    let ministries: [MinistryData]
    let onMinistryTap: ((MinistryData) -> Void)?

    init(
        ministries: [MinistryData]? = nil,
        onMinistryTap: ((MinistryData) -> Void)? = nil
    ) {
        self.ministries = ministries ?? Self.defaultMinistries
        self.onMinistryTap = onMinistryTap
    }

    var body: some View {
        AppleSection(
            title: "사역팀",
            icon: "person.3.sequence.fill",
            size: .large,
            showSeeAll: true
        ) {
            HorizontalCardCarousel(
                items: ministries,
                itemSpacing: AppSpacing.medium,
                horizontalPadding: AppSpacing.large
            ) { ministry in
                Button(action: { onMinistryTap?(ministry) }) {
                    MinistryCard(ministry: ministry)
                }
                .id(ministry.id)
                .accessibilityLabel(ministry.name)
                .accessibilityHint("사역팀 상세 정보를 엽니다")
                .accessibilityValue("리더 \(ministry.leader), 인원 \(ministry.memberCount)명")
                .accessibilityAddTraits(.isButton)
            }
        }
    }
}

struct MinistryCard: View {
    let ministry: MinistryData

    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            HStack(spacing: AppSpacing.small) {
                Image(systemName: ministry.icon)
                    .font(AppFonts.title3)
                    .foregroundStyle(AppColors.textOnTint)
                    .frame(width: AppSpacing.jumbo, height: AppSpacing.jumbo)
                    .background(ministry.color)
                    .clipShape(Circle())
                    .accessibilityHidden(true)

                VStack(alignment: .leading, spacing: AppSpacing.xxs) {
                    Text(ministry.name)
                        .font(AppFonts.subheadline)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)

                    Text(ministry.leader)
                        .font(AppFonts.caption1)
                        .foregroundStyle(AppColors.textSecondary)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                }

                Spacer()
            }

            HStack(spacing: AppSpacing.xSmall) {
                Image(systemName: "person.fill")
                    .font(.caption2.weight(.semibold))
                    .accessibilityHidden(true)

                Text("\(ministry.memberCount)명")
                    .font(AppFonts.caption1)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
            .foregroundStyle(AppColors.textSecondary)

            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: AppSpacing.screen * 3, alignment: .leading)
        .padding(AppSpacing.medium)
        .liquidGlass(.card, cornerRadius: AppRadius.card)
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    MinistrySection()
        .padding()
}
