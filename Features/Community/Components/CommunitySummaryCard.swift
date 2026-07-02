import SwiftUI

struct CommunitySummaryCard: View {

    var body: some View {

        LiquidCard {

            VStack(
                alignment: .leading,
                spacing: 20
            ) {

                Label(
                    "청년부 공동체",
                    systemImage: "person.3.fill"
                )

                .font(AppFonts.headline)

                Text("서로 사랑하고 함께 성장하는 공동체를 만들어 갑니다.")

                    .font(AppFonts.body)

                    .foregroundStyle(
                        AppColors.textSecondary
                    )

                Divider()

                HStack {

                    stat(
                        title: "청년",
                        value: "132"
                    )

                    Spacer()

                    stat(
                        title: "소그룹",
                        value: "8"
                    )

                    Spacer()

                    stat(
                        title: "사역팀",
                        value: "6"
                    )

                }

            }

        }

    }

    @ViewBuilder

    private func stat(
        title: String,
        value: String
    ) -> some View {

        VStack {

            Text(value)

                .font(AppFonts.title2)

                .fontWeight(.bold)

            Text(title)

                .font(AppFonts.caption)

                .foregroundStyle(
                    AppColors.textSecondary
                )

        }

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        CommunitySummaryCard()

            .padding()

    }

}