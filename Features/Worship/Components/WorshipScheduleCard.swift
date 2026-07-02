import SwiftUI

struct WorshipScheduleCard: View {

    var body: some View {

        LiquidCard {

            VStack(
                alignment: .leading,
                spacing: 20
            ) {

                Label(

                    "이번 주 예배",

                    systemImage: "church.fill"

                )

                .font(AppFonts.headline)

                VStack(
                    alignment: .leading,
                    spacing: 10
                ) {

                    scheduleRow(

                        icon: "calendar",

                        title: "일시",

                        value: "주일 오후 2:00"

                    )

                    scheduleRow(

                        icon: "mappin.and.ellipse.fill",

                        title: "장소",

                        value: "서대문교회 본당"

                    )

                    scheduleRow(

                        icon: "music.note",

                        title: "찬양",

                        value: "청년부 찬양팀"

                    )

                }

            }

        }

    }

    @ViewBuilder

    private func scheduleRow(

        icon: String,

        title: String,

        value: String

    ) -> some View {

        HStack(alignment: .top) {

            Image(systemName: icon)

                .frame(width: 22)

                .foregroundStyle(AppColors.accent)

            VStack(
                alignment: .leading,
                spacing: 4
            ) {

                Text(title)

                    .font(AppFonts.caption)

                    .foregroundStyle(AppColors.textSecondary)

                Text(value)

                    .font(AppFonts.body)

            }

            Spacer()

        }

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        WorshipScheduleCard()

            .padding()

    }

}