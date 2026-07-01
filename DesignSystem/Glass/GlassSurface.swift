import SwiftUI

struct GlassSurface: ViewModifier {

    @State
    private var motion = DeviceMotionManager()

    func body(content: Content) -> some View {

        content
            .background(GlassBackdrop(materialType: .ultraThin))
            .overlay(GlassEdgeHighlight(materialType: .ultraThin, cornerRadius: AppRadius.card))
            .overlay(GlassInnerGlow(materialType: .ultraThin))
            .overlay(GlassSpecularHighlight(materialType: .ultraThin))
            .overlay(GlassEnvironmentMirror(x: motion.roll * 80, y: motion.pitch * 80, materialType: .ultraThin))
            .overlay(GlassDynamicShadow(materialType: .ultraThin, cornerRadius: AppRadius.card))
            .overlay(GlassBorderStroke(materialType: .ultraThin, cornerRadius: AppRadius.card))
            .overlay(GlassNoiseDynamic(materialType: .ultraThin))
            .clipShape(
                RoundedRectangle(
                    cornerRadius: AppRadius.card,
                    style: .continuous
                )
            )
            .shadow(
                color: AppShadow.color,
                radius: AppShadow.radius,
                y: AppShadow.y
            )
            .modifier(ReflectionAnimation())

    }

}