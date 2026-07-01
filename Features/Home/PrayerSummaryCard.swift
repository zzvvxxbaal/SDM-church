import SwiftUI

struct PrayerSummaryCard: View {

    var body: some View {

        LiquidCard {

            HStack {

                VStack(alignment: .leading, spacing: AppSpacing.smPlus) {

                    Text("기도제목")

                        .font(.headline)

                    Text("3개의 새로운 기도제목")

                        .foregroundStyle(.secondary)

                }

                Spacer()

                Image(systemName: "hands.sparkles.fill")

                    .font(AppFonts.hero)

                    .foregroundStyle(AppColors.warning)
                    .accessibilityHidden(true)

            }

        }

    }

}