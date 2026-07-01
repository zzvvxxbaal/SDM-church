import SwiftUI

struct PressAnimation: ViewModifier {

    let pressed: Bool

    func body(content: Content) -> some View {

        content
            .scaleEffect(pressed ? 0.965 : 1.0)
            .animation(
                Springs.button,
                value: pressed
            )

    }

}
