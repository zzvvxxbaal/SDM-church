import SwiftUI

struct GlassShader: ViewModifier {

    @State
    private var motion = DeviceMotionManager()

    func body(content: Content) -> some View {

        content

            .background(.ultraThinMaterial)

            .overlay {

                GlassRefraction()

            }

            .overlay {

                GlassLighting()

            }

            .overlay {

                GlassSpecular()

            }

            .overlay {

                GlassCaustic()

            }

            .overlay {

                GlassEnvironmentReflection(

                    x: motion.roll * 80,

                    y: motion.pitch * 80

                )

            }

            .overlay {

                LiquidBorder()

            }

            .overlay {

                GlassNoise()

            }

            .clipShape(

                RoundedRectangle(

                    cornerRadius: AppRadius.card,

                    style: .continuous

                )

            )

    }

}