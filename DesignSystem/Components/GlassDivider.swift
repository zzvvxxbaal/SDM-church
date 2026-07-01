import SwiftUI

struct GlassDivider: View {

    var body: some View {

        Rectangle()

            .fill(

                LinearGradient(
                    gradient: Gradient(colors: [
                        .white.opacity(0.08),
                        .white.opacity(0.04),
                        .white.opacity(0.08)
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing
                )

            )

            .frame(height: 1)

    }

}