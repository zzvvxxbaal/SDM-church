import SwiftUI

struct WorshipScheduleCard: View {

    var body: some View {

        LiquidCard {

            VStack(alignment: .leading, spacing: 14) {

                Text("이번 주 예배")

                    .font(.headline)

                Label(

                    "주일 오후 2:00",

                    systemImage: "clock"

                )

                Label(

                    "청년부 예배실",

                    systemImage: "mappin"

                )

                Label(

                    "말씀 : 마태복음 6장",

                    systemImage: "book.closed"

                )

            }

        }

    }

}