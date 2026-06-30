import SwiftUI

struct HomeBanner: View {

    var body: some View {

        LiquidCard {

            VStack(alignment: .leading, spacing: 14) {

                Text("Welcome")

                    .font(.headline)

                    .foregroundStyle(.secondary)

                Text("예배를 통해\n하나님을 만나보세요.")

                    .font(.system(size: 30, weight: .bold))

                LiquidBadge(

                    title: "이번 주"

                )

            }

        }

    }

}