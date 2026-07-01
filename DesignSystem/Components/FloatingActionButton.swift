import SwiftUI

struct FloatingActionButton: View {

    let systemImage: String

    let action: () -> Void

    @State private var isPressed = false

    var body: some View {

        Button(

            action: action

        ) {

            Image(

                systemName: systemImage

            )

            .font(.title2)

            .frame(

                width: 64,

                height: 64

            )

        }

        .buttonStyle(.plain)

        .liquidGlass(.floating, cornerRadius: 32)

        .buttonPress(isPressed: isPressed, scale: 0.9, opacity: 0.8, hapticFeedback: true)

        .floating(offset: 6, duration: 2.5)

        .onTouchDown { isPressed = true }

        .onTouchUp { isPressed = false }

    }

}