import SwiftUI

struct GlassHighlight: View {

    var body: some View {

        LinearGradient(

            colors: [

                .white.opacity(0.35),

                .white.opacity(0.02)

            ],

            startPoint: .top,

            endPoint: .bottom

        )

    }

}