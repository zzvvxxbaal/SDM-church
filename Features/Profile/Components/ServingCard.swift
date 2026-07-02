import SwiftUI

struct ServingCard: View {

    var body: some View {

        LiquidCard {

            Label(
                "사역",
                systemImage: "hands.sparkles.fill"
            )

            Divider()

            HStack {

                Text("미디어팀")

                Spacer()

                Text("활동중")

                    .foregroundStyle(.green)

            }

        }

    }

}
