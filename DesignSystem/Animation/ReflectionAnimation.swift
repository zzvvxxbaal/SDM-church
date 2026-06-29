import SwiftUI

struct ReflectionAnimation: ViewModifier {

    @State
    private var offset: CGFloat = -240

    func body(content: Content) -> some View {

        content

            .overlay {

                LinearGradient(

                    colors: [

                        .clear,

                        .white.opacity(0.22),

                        .clear

                    ],

                    startPoint: .topLeading,

                    endPoint: .bottomTrailing

                )

                .rotationEffect(.degrees(18))

                .offset(x: offset)

                .blendMode(.screen)

                .allowsHitTesting(false)

            }

            .task {

                withAnimation(

                    .linear(duration: 5)

                    .repeatForever(autoreverses: false)

                ) {

                    offset = 240

                }

            }

    }

}