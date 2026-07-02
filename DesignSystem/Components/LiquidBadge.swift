import SwiftUI

struct LiquidBadge: View {

    let title: String

    var color: Color = AppColors.accent

    var body: some View {

        Text(title)

            .font(AppFonts.caption)

            .fontWeight(.semibold)

            .padding(.horizontal, 12)

            .padding(.vertical, 6)

            .background {

                Capsule()

                    .fill(color.opacity(0.14))

            }

            .overlay {

                Capsule()

                    .strokeBorder(

                        color.opacity(0.20),

                        lineWidth: 1

                    )

            }

    }

}