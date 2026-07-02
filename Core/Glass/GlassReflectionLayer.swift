import SwiftUI

struct GlassReflectionLayer: View {

    let opacity: Double

    let cornerRadius: CGFloat

    var body: some View {

        RoundedRectangle(

            cornerRadius: cornerRadius,

            style: .continuous

        )

        .fill(

            LinearGradient(

                colors: [

                    Color.white.opacity(opacity),

                    Color.white.opacity(opacity * 0.35),

                    .clear

                ],

                startPoint: .topLeading,

                endPoint: .bottomTrailing

            )

        )

        .blendMode(.screen)

        .allowsHitTesting(false)

    }

}