import SwiftUI

struct SmallGroupCard: View {

    var body: some View {

        LiquidCard {

            Label(
                "소그룹",
                systemImage: "person.2.fill"
            )

            Divider()

            row("1청", "매주 금요일")

            Divider()

            row("2청", "매주 토요일")

            Divider()

            row("3청", "주일 예배 후")

        }

    }

    @ViewBuilder

    private func row(
        _ group: String,
        _ schedule: String
    ) -> some View {

        HStack {

            Text(group)

            Spacer()

            Text(schedule)

                .foregroundStyle(
                    AppColors.textSecondary
                )

        }

        .font(AppFonts.body)

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        SmallGroupCard()

            .padding()

    }

}
