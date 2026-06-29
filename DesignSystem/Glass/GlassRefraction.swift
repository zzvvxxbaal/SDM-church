import SwiftUI

struct GlassRefraction: View {

    var body: some View {

        RoundedRectangle(
            cornerRadius: AppRadius.card,
            style: .continuous
        )

        .fill(.white.opacity(0.02))

        .overlay {

            LinearGradient(

                colors: [

                    .white.opacity(0.08),

                    .clear,

                    .white.opacity(0.03)

                ],

                startPoint: .topLeading,

                endPoint: .bottomTrailing

            )

        }

    }

}