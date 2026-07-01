import SwiftUI

struct LiquidButton: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {

        configuration.label

            .font(AppFonts.headline)

            .frame(maxWidth: .infinity)

            .frame(height: 60)

            .liquidGlass(.button, cornerRadius: AppRadius.button)

            .buttonPress(
                isPressed: configuration.isPressed,
                scale: 0.95,
                opacity: 0.85,
                hapticFeedback: true
            )

    }

}