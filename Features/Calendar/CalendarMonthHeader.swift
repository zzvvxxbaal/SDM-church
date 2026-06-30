import SwiftUI

struct CalendarMonthHeader: View {

    var body: some View {

        HStack {

            Text("2026년 7월")

                .font(.largeTitle.bold())

            Spacer()

            LiquidIconButton(

                systemImage: "chevron.left"

            ) {

            }

            LiquidIconButton(

                systemImage: "chevron.right"

            ) {

            }

        }

    }

}