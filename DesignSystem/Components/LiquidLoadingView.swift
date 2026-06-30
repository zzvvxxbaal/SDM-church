import SwiftUI

struct LiquidLoadingView: View {

    @State

    private var rotate = 0.0

    var body: some View {

        Circle()

            .trim(

                from: 0,

                to: 0.75

            )

            .stroke(

                AppColors.tint,

                style: StrokeStyle(

                    lineWidth: 5,

                    lineCap: .round

                )

            )

            .frame(

                width: 40,

                height: 40

            )

            .rotationEffect(

                .degrees(

                    rotate

                )

            )

            .onAppear {

                withAnimation(

                    .linear(duration: 1)

                    .repeatForever(autoreverses: false)

                ) {

                    rotate = 360

                }

            }

    }

}