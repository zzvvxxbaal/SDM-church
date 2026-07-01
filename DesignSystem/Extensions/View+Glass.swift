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
    
    func liquidGlassOptimized(
        _ materialType: GlassMaterialType = .regular,
        cornerRadius: CGFloat = 16,
        configuration: GlassConfiguration = .default
    ) -> some View {
        modifier(GlassRenderer(materialType: materialType, cornerRadius: cornerRadius, configuration: configuration))
    }
    
    func liquidGlassAdaptive(
        _ materialType: GlassMaterialType = .regular,
        cornerRadius: CGFloat = 16,
        configuration: GlassConfiguration = .default
    ) -> some View {
        modifier(GlassAdaptiveRenderer(materialType: materialType, cornerRadius: cornerRadius, configuration: configuration))
    }
    
    func liquidGlassEnvironmentAware(
        _ materialType: GlassMaterialType = .regular,
        cornerRadius: CGFloat = 16,
        configuration: GlassConfiguration = .default
    ) -> some View {
        modifier(GlassEnvironmentAwareRenderer(materialType: materialType, cornerRadius: cornerRadius, configuration: configuration))
    }
    
    func glassReflectionDynamic(
        configuration: GlassConfiguration = .default,
        cornerRadius: CGFloat = 16
    ) -> some View {
        modifier(GlassReflectionEngine(configuration: configuration, cornerRadius: cornerRadius))
    }
    
    func glassRefractionDynamic(
        configuration: GlassConfiguration = .default,
        cornerRadius: CGFloat = 16
    ) -> some View {
        modifier(GlassRefractionEngine(configuration: configuration, cornerRadius: cornerRadius))
    }

}