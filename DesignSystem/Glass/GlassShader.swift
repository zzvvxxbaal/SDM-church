import SwiftUI

struct GlassShader: ViewModifier {

    @State
    private var motion = DeviceMotionManager()

    func body(content: Content) -> some View {

        content
            .background(GlassBackdrop(materialType: .regular))
            .overlay(GlassEdgeHighlight(materialType: .regular, cornerRadius: AppRadius.card))
            .overlay(GlassInnerGlow(materialType: .regular))
            .overlay(GlassSpecularHighlight(materialType: .regular))
            .overlay(GlassEnvironmentMirror(x: motion.roll * 80, y: motion.pitch * 80, materialType: .regular))
            .overlay(GlassDynamicShadow(materialType: .regular, cornerRadius: AppRadius.card))
            .overlay(GlassBorderStroke(materialType: .regular, cornerRadius: AppRadius.card))
            .overlay(GlassNoiseDynamic(materialType: .regular))
            .overlay(GlassCausticEffect(materialType: .regular))
            .clipShape(
                RoundedRectangle(
                    cornerRadius: AppRadius.card,
                    style: .continuous
                )
            )

    }

}