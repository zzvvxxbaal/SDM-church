import SwiftUI

struct UpcomingScheduleCard: View {

    var body: some View {

        LiquidCard {

            VStack(
                alignment: .leading,
                spacing: 20
            ) {

                Label(
                    "다가오는 일정",
                    systemImage: "calendar.badge.clock"
                )

                .font(AppFonts.headline)

                scheduleRow(
                    title: "주일 예배",
                    date: "7월 6일 오후 2:00"
                )

                Divider()

                scheduleRow(
                    title: "청년부 소그룹",
                    date: "7월 9일 오후 7:30"
                )

                Divider()

                scheduleRow(
                    title: "금요기도회",
                    date: "7월 11일 오후 8:00"
                )

            }

        }

    }

    @ViewBuilder

    private func scheduleRow(

        title: String,

        date: String

    ) -> some View {

        HStack {

            VStack(
                alignment: .leading,
                spacing: 4
            ) {

                Text(title)

                    .font(AppFonts.body)

                Text(date)

                    .font(AppFonts.caption)

                    .foregroundStyle(
                        AppColors.textSecondary
                    )

            }

            Spacer()

            Image(systemName: "chevron.right")

                .foregroundStyle(
                    AppColors.textSecondary
                )

        }

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        UpcomingScheduleCard()

            .padding()

    }

}