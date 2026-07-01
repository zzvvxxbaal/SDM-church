import SwiftUI

struct GlassAdaptiveRenderer: ViewModifier {
    let materialType: GlassMaterialType
    let cornerRadius: CGFloat
    let configuration: GlassConfiguration
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    func body(content: Content) -> some View {
        let adaptiveConfig = self.createAdaptiveConfiguration()
        
        return content
            .modifier(
                GlassRenderer(
                    materialType: materialType,
                    cornerRadius: cornerRadius,
                    configuration: adaptiveConfig
                )
            )
    }
    
    private func createAdaptiveConfiguration() -> GlassConfiguration {
        var config = configuration
        
        if reduceTransparency {
            config = GlassConfiguration(
                blurIntensity: config.blurIntensity,
                opacityMultiplier: 1.5,
                highlightIntensity: config.highlightIntensity * 0.8,
                borderIntensity: config.borderIntensity * 0.9,
                shadowIntensity: config.shadowIntensity,
                reflectionIntensity: config.reflectionIntensity * 0.5,
                refractionIntensity: config.refractionIntensity * 0.5,
                noiseIntensity: config.noiseIntensity,
                causticIntensity: config.causticIntensity * 0.3,
                dynamicBlurEnabled: false,
                dynamicOpacityEnabled: false,
                dynamicReflectionEnabled: false,
                dynamicLightingEnabled: false,
                dynamicBorderEnabled: false,
                performanceMode: .performance
            )
        }
        
        if reduceMotion {
            config = GlassConfiguration(
                blurIntensity: config.blurIntensity,
                opacityMultiplier: config.opacityMultiplier,
                highlightIntensity: config.highlightIntensity,
                borderIntensity: config.borderIntensity,
                shadowIntensity: config.shadowIntensity,
                reflectionIntensity: config.reflectionIntensity,
                refractionIntensity: config.refractionIntensity,
                noiseIntensity: config.noiseIntensity,
                causticIntensity: config.causticIntensity,
                dynamicBlurEnabled: false,
                dynamicOpacityEnabled: false,
                dynamicReflectionEnabled: false,
                dynamicLightingEnabled: false,
                dynamicBorderEnabled: false,
                performanceMode: config.performanceMode
            )
        }
        
        if colorScheme == .dark {
            config = GlassConfiguration(
                blurIntensity: config.blurIntensity * 0.9,
                opacityMultiplier: config.opacityMultiplier * 0.8,
                highlightIntensity: config.highlightIntensity * 0.7,
                borderIntensity: config.borderIntensity * 0.6,
                shadowIntensity: config.shadowIntensity * 0.9,
                reflectionIntensity: config.reflectionIntensity * 0.8,
                refractionIntensity: config.refractionIntensity * 0.7,
                noiseIntensity: config.noiseIntensity,
                causticIntensity: config.causticIntensity * 0.6,
                dynamicBlurEnabled: config.dynamicBlurEnabled,
                dynamicOpacityEnabled: config.dynamicOpacityEnabled,
                dynamicReflectionEnabled: config.dynamicReflectionEnabled,
                dynamicLightingEnabled: config.dynamicLightingEnabled,
                dynamicBorderEnabled: config.dynamicBorderEnabled,
                performanceMode: config.performanceMode
            )
        }
        
        return config
    }
}

extension View {
    func glassAdaptive(
        _ materialType: GlassMaterialType = .regular,
        cornerRadius: CGFloat = 16,
        configuration: GlassConfiguration = .default
    ) -> some View {
        modifier(
            GlassAdaptiveRenderer(
                materialType: materialType,
                cornerRadius: cornerRadius,
                configuration: configuration
            )
        )
    }
}
