import SwiftUI

struct GlassEnvironmentReflection: View {

    var x: CGFloat

    var y: CGFloat

    var body: some View {

        RadialGradient(

            colors: [

                .white.opacity(0.30),

                .white.opacity(0.08),

                .clear

            ],

            center: .center,

            startRadius: 0,

            endRadius: 260

        )

        .offset(x: x, y: y)

        .blendMode(.screen)

    }

}