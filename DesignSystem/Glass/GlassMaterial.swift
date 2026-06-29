import SwiftUI

struct GlassMaterial: ViewModifier {

    func body(content: Content) -> some View {

        content

            .background(.ultraThinMaterial)

            .overlay {

                GlassHighlight()

            }

            .overlay {

                GlassBorder()

            }

            .overlay {

                GlassReflection()

                    .blendMode(.screen)

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