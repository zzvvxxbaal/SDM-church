import SwiftUI

extension View {

    func glass() -> some View {

        modifier(GlassShader())

    }

    func glassSurface() -> some View {

        modifier(GlassSurface())

    }
    
    func liquidGlass(
        _ materialType: GlassMaterialType = .regular,
        cornerRadius: CGFloat = 16
    ) -> some View {
        modifier(LiquidGlassEngine(materialType: materialType, cornerRadius: cornerRadius))
    }

}