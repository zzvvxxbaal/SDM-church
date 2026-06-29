import SwiftUI

struct LiquidButton: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {

        configuration.label

            .font(AppFonts.headline)

            .foregroundStyle(.primary)

            .frame(maxWidth: .infinity)

            .frame(height: 60)

            .glass()

            .modifier(

                PressAnimation(

                    pressed: configuration.isPressed

                )

            )

    }

}