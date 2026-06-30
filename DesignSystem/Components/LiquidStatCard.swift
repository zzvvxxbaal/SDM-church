import SwiftUI

struct LiquidStatCard: View {

    let title: String

    let value: String

    let icon: String

    var body: some View {

        LiquidCard {

            VStack(alignment: .leading, spacing: 14) {

                Image(systemName: icon)

                    .font(.title2)

                    .foregroundStyle(AppColors.tint)

                Text(value)

                    .font(.system(size: 28, weight: .bold))

                Text(title)

                    .foregroundStyle(.secondary)

            }

        }

    }

}

#Preview {

    LiquidStatCard(

        title: "출석",

        value: "24",

        icon: "checkmark.circle.fill"

    )

}