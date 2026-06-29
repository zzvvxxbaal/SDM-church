import SwiftUI

struct GlassShader: ViewModifier {

    func body(content: Content) -> some View {

        content

            .background(.ultraThinMaterial)

            .overlay {

                GlassLighting()

            }

            .overlay {

                GlassRefraction()

            }

            .overlay {

                GlassHighlight()

            }

            .overlay {

                GlassReflection()

            }

            .overlay {

                GlassBorder()

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