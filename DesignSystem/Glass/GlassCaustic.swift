import SwiftUI

struct GlassCaustic: View {

    var body: some View {

        AngularGradient(

            colors: [

                .white.opacity(0.08),

                .clear,

                .white.opacity(0.05),

                .clear

            ],

            center: .center

        )

        .blur(radius: 40)

    }

}