import SwiftUI

struct GlassReflection: View {

    var body: some View {

        LinearGradient(

            colors: [

                .clear,

                .white.opacity(0.20),

                .clear

            ],

            startPoint: .leading,

            endPoint: .trailing

        )

        .rotationEffect(.degrees(18))

    }

}