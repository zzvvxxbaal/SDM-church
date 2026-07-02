import SwiftUI

struct PrayerSummaryCard: View {

    var body: some View {

        LiquidCard {

            VStack(
                alignment: .leading,
                spacing: 20
            ) {

                Label(
                    "이번 주 기도제목",
                    systemImage: "hands.sparkles.fill"
                )
                .font(AppFonts.headline)

                Text("이번 한 주도 하나님 안에서 믿음이 성장하고, 청년부 공동체가 서로를 위해 기도하며 사랑 안에서 하나 되기를 소망합니다.")

                    .font(AppFonts.body)

                    .fixedSize(
                        horizontal: false,
                        vertical: true
                    )

                Divider()

                HStack {

                    VStack(alignment: .leading) {

                        Text("참여")

                            .font(AppFonts.caption)

                            .foregroundStyle(
                                AppColors.textSecondary
                            )

                        Text("128명")

                            .font(AppFonts.title3)

                            .fontWeight(.bold)

                    }

                    Spacer()

                    VStack(alignment: .trailing) {

                        Text("이번 주")

                            .font(AppFonts.caption)

                            .foregroundStyle(
                                AppColors.textSecondary
                            )

                        Text("24개")

                            .font(AppFonts.title3)

                            .fontWeight(.bold)

                    }

                }

            }

        }

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        PrayerSummaryCard()

            .padding()

    }

}