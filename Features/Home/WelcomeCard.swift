import SwiftUI

struct WelcomeCard: View {

    var body: some View {

        LiquidCard {

            HStack {

                VStack(alignment: .leading, spacing: AppSpacing.smPlus) {

                    Text("오늘도 평안하세요")

                        .font(.headline)

                        .foregroundStyle(.secondary)

                    Text("하나님께서 함께하십니다.")

                        .font(.title2.bold())

                }

                Spacer()

                Image(systemName: "sun.max.fill")

                    .font(AppFonts.hero)

                    .foregroundStyle(AppColors.warning)

            }

        }

    }

}