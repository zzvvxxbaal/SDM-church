import SwiftUI

struct HomeBanner: View {

    var body: some View {

        LiquidCard {

            VStack(alignment: .leading, spacing: AppSpacing.mdPlus) {

                Text("Welcome")

                    .font(.headline)

                    .foregroundStyle(.secondary)

                Text("예배를 통해\n하나님을 만나보세요.")

                    .font(AppFonts.title)

                LiquidBadge(

                    title: "이번 주"

                )

            }

        }

    }

}