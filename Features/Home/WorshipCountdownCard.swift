import SwiftUI

struct WorshipCountdownCard: View {

    var body: some View {

        LiquidCard {

            VStack(spacing: 16) {

                Text("다음 예배까지")

                    .font(.headline)

                Text("02일 18시간")

                    .font(

                        .system(

                            size: 36,

                            weight: .bold,

                            design: .rounded

                        )

                    )

                LiquidProgress(

                    value: 0.72

                )

            }

        }

    }

}