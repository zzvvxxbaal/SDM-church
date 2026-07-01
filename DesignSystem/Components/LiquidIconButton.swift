import SwiftUI

struct LiquidIconButton: View {

    let systemImage: String

    let action: () -> Void

    @State private var isPressed = false

    var body: some View {

        Button(action: action) {

            Image(systemName: systemImage)

                .font(.title3)

                .frame(width: 52, height: 52)

        }

        .buttonStyle(.plain)

        .liquidGlass(.button, cornerRadius: 26)

        .buttonPress(isPressed: isPressed, scale: 0.9, opacity: 0.8, hapticFeedback: true)

        .onTouchDown { isPressed = true }

        .onTouchUp { isPressed = false }

    }

}