import SwiftUI

struct GlassSpecular: View {

    var body: some View {

        LinearGradient(

            colors: [

                .white.opacity(0.55),

                .white.opacity(0.18),

                .clear

            ],

            startPoint: .topLeading,

            endPoint: .bottomTrailing

        )

        .blendMode(.plusLighter)

    }

}