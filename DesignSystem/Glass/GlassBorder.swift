import SwiftUI

struct GlassBorder: View {

    var body: some View {

        RoundedRectangle(

            cornerRadius: AppRadius.card,

            style: .continuous

        )

        .stroke(

            Color.white.opacity(0.28),

            lineWidth: 1

        )

    }

}