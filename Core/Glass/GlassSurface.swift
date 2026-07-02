import SwiftUI

struct GlassSurface<Content: View>: View {

    let material: GlassProvider.Material

    @ViewBuilder
    let content: Content

    private var configuration: GlassConfiguration {

        GlassProvider.configuration(
            for: material
        )

    }

    var body: some View {

        content

            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )

            .background {

                RoundedRectangle(
                    cornerRadius: configuration.cornerRadius,
                    style: .continuous
                )
                .fill(.clear)
                .glassBackgroundEffect()

            }

            .overlay {

                RoundedRectangle(
                    cornerRadius: configuration.cornerRadius,
                    style: .continuous
                )
                .strokeBorder(

                    LinearGradient(

                        colors: [

                            Color.white.opacity(
                                configuration.highlight
                            ),

                            Color.white.opacity(0.02)

                        ],

                        startPoint: .topLeading,

                        endPoint: .bottomTrailing

                    ),

                    lineWidth: configuration.border

                )

            }

            .overlay {

                GlassReflectionLayer(

                    opacity: configuration.reflection,

                    cornerRadius: configuration.cornerRadius

                )

            }

            .shadow(

                color: .black.opacity(0.12),

                radius: configuration.shadow,

                y: configuration.shadow / 2

            )

    }

}