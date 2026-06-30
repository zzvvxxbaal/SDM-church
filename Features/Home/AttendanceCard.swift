import SwiftUI

struct AttendanceCard: View {

    var body: some View {

        LiquidCard {

            HStack {

                VStack(alignment: .leading, spacing: 8) {

                    Text("이번 달 출석")

                        .font(.headline)

                    Text("4 / 5")

                        .font(.system(size: 34, weight: .bold))

                }

                Spacer()

                VStack(alignment: .trailing, spacing: 8) {

                    Text("80%")

                        .font(.title3.bold())

                    LiquidProgress(

                        value: 0.8

                    )

                    .frame(width: 120)

                }

            }

        }

    }

}