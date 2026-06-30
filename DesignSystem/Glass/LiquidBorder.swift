import SwiftUI

struct LiquidBorder: View {

    @State
    private var angle: Double = 0

    var body: some View {

        RoundedRectangle(

            cornerRadius: AppRadius.card,

            style: .continuous

        )

        .stroke(

            AngularGradient(

                colors: [

                    .white.opacity(0.15),

                    .white.opacity(0.70),

                    .white.opacity(0.12),

                    .white.opacity(0.50),

                    .white.opacity(0.15)

                ],

                center: .center,

                angle: .degrees(angle)

            ),

            lineWidth: 1.2

        )

        .onAppear {

            withAnimation(

                .linear(duration: 10)

                    .repeatForever(autoreverses: false)

            ) {

                angle = 360

            }

        }

    }

}