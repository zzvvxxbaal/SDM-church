import SwiftUI

struct HomeCard: View {
    let section: HomeSection

    var body: some View {
        LiquidCard {
            HStack(alignment: .top, spacing: AppSpacing.medium) {
                Image(systemName: section.icon)
                    .font(.title2)
                    .foregroundStyle(AppColors.tint)
                    .frame(width: 42)

                VStack(alignment: .leading, spacing: AppSpacing.small) {
                    Text(section.title)
                        .font(.headline)
                        .lineLimit(2)
                        .minimumScaleFactor(0.85)

                    Text(section.subtitle)
                        .font(.body)
                        .foregroundStyle(AppColors.textSecondary)
                        .lineLimit(2)
                        .minimumScaleFactor(0.85)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(AppColors.textTertiary)
            }
        }
    }
}

#Preview {
    HomeCard(
        section: HomeSection(
            title: "오늘의 말씀",
            subtitle: "말씀을 묵상하세요.",
            icon: "book.closed.fill"
        )
    )
}
