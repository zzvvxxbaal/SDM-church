import SwiftUI

struct GlassSurface: ViewModifier {

    func body(content: Content) -> some View {

        content

            .background(.ultraThinMaterial)

            .clipShape(

                RoundedRectangle(

                    cornerRadius: AppRadius.card,

                    style: .continuous

                )

            )

            .overlay {

                RoundedRectangle(

                    cornerRadius: AppRadius.card,

                    style: .continuous

                )

                .stroke(

                    LinearGradient(

                        colors: [

                            .white.opacity(0.70),

                            .white.opacity(0.08)

                        ],

                        startPoint: .topLeading,

                        endPoint: .bottomTrailing

                    ),

                    lineWidth: 1

                )

            }

            .shadow(

                color: AppShadow.color,

                radius: AppShadow.radius,

                y: AppShadow.y

            )

            .modifier(ReflectionAnimation())

    }

}