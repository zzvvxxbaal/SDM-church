import SwiftUI

struct NoticeCard: View {

    let notice: Notice

    var body: some View {

        LiquidCard {

            HStack(alignment: .top) {

                VStack(alignment: .leading, spacing: AppSpacing.smPlus) {

                    if notice.isPinned {

                        LiquidBadge(title: "공지")

                    }

                    Text(notice.title)

                        .font(AppFonts.headline)

                    Text(notice.summary)

                        .foregroundStyle(.secondary)

                    Text(notice.date)

                        .font(AppFonts.caption1)

                        .foregroundStyle(.tertiary)

                }

                Spacer()

                Image(systemName: "chevron.right")

                    .foregroundStyle(.tertiary)
                    .accessibilityHidden(true)

            }

        }

    }

}