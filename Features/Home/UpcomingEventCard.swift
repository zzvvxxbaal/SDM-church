import SwiftUI

struct UpcomingEventCard: View {

    var body: some View {

        LiquidCard {

            HStack {

                VStack(alignment: .leading, spacing: AppSpacing.smPlus) {

                    Text("다가오는 일정")

                        .font(.headline)

                    Text("청년부 여름수련회")

                        .font(.title3.bold())

                    Text("2026.07.24 ~ 07.26")

                        .foregroundStyle(.secondary)

                }

                Spacer()

                Image(systemName: "calendar.badge.clock")

                    .font(AppFonts.hero)

                    .foregroundStyle(AppColors.tint)

            }

        }

    }

}