import SwiftUI

struct AttendanceCard: View {

    var body: some View {

        LiquidCard {

            Label(
                "출석",
                systemImage: "checkmark.circle.fill"
            )

            Divider()

            stat("이번 달", "4회")

            Divider()

            stat("연속", "12주")

        }

    }

    private func stat(
        _ title: String,
        _ value: String
    ) -> some View {

        HStack {

            Text(title)

            Spacer()

            Text(value)

                .fontWeight(.bold)

        }

    }

}
