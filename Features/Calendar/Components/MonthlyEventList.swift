import SwiftUI

struct MonthlyEventList: View {

    var body: some View {

        LiquidCard {

            VStack(
                spacing: 0
            ) {

                event(
                    day: "06",
                    title: "주일 예배"
                )

                Divider()

                event(
                    day: "09",
                    title: "소그룹 모임"
                )

                Divider()

                event(
                    day: "11",
                    title: "금요기도회"
                )

                Divider()

                event(
                    day: "20",
                    title: "청년부 모임"
                )

            }

        }

    }

    @ViewBuilder

    private func event(

        day: String,

        title: String

    ) -> some View {

        HStack {

            Text(day)

                .font(AppFonts.title3)

                .fontWeight(.bold)

                .frame(width: 44)

            Text(title)

                .font(AppFonts.body)

            Spacer()

        }

        .padding(.vertical, 14)

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        MonthlyEventList()

            .padding()

    }

}