import SwiftUI

struct LiquidButton: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {

        configuration.label

            .font(AppFonts.headline)

            .frame(maxWidth: .infinity)

            .frame(height: 60)

            .liquidGlass(.button, cornerRadius: AppRadius.button)

            .pressAnimation(
                pressed: configuration.isPressed,
                scale: 0.95,
                rotation: 1.0
            )

    }

}