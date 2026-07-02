import SwiftUI

struct LiquidIcon: View {

    let systemName: String

    var size: CGFloat = 48

    var body: some View {

        ZStack {

            Circle()

                .fill(

                    AppColors.accent.opacity(0.12)

                )

            Image(systemName: systemName)

                .font(.system(size: size * 0.38))

                .foregroundStyle(

                    AppColors.accent

                )

        }

        .frame(
            width: size,
            height: size
        )

    }

}
