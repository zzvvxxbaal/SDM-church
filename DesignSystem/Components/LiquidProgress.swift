import SwiftUI

struct LiquidProgress: View {

    let value: Double

    var body: some View {

        GeometryReader { geo in

            RoundedRectangle(

                cornerRadius: AppRadius.xl

            )

            .fill(.white.opacity(0.12))

            .overlay(alignment: .leading) {

                RoundedRectangle(

                    cornerRadius: AppRadius.xl

                )

                .fill(

                    AppColors.tint

                )

                .frame(

                    width: geo.size.width * value

                )

            }

        }

        .frame(height: 10)

    }

}