import SwiftUI

struct GlassLighting: View {

    var body: some View {

        LinearGradient(

            colors: [

                .white.opacity(0.42),

                .white.opacity(0.08),

                .clear

            ],

            startPoint: .topLeading,

            endPoint: .bottomTrailing

        )
        .blendMode(.screen)

    }

}