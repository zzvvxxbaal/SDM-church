import SwiftUI

struct GlassMorph: ViewModifier {

    var pressed: Bool

    func body(content: Content) -> some View {

        content

            .scaleEffect(
                pressed ? 0.965 : 1
            )

            .rotation3DEffect(

                .degrees(

                    pressed ? 0.8 : 0

                ),

                axis: (

                    x: 1,

                    y: 0,

                    z: 0

                )

            )

            .animation(

                Springs.button,

                value: pressed

            )

    }

}