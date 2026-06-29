import SwiftUI

struct LiquidButton: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {

        configuration.label

            .font(AppFonts.headline)

            .frame(maxWidth: .infinity)

            .frame(height: 60)

            .glass()

            .modifier(

                GlassMorph(

                    pressed: configuration.isPressed

                )

            )

    }

}