import SwiftUI

struct AttendanceCard: View {

    var body: some View {

        LiquidCard {

            HStack {

                VStack(alignment: .leading, spacing: AppSpacing.small) {

                    Text("이번 달 출석")

                        .font(.headline)

                    Text("4 / 5")

                        .font(AppFonts.largeTitle)

                }

                Spacer()

                VStack(alignment: .trailing, spacing: AppSpacing.small) {

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