import SwiftUI

struct GlassConfiguration {
    let blurIntensity: CGFloat
    let opacityMultiplier: CGFloat
    let highlightIntensity: CGFloat
    let borderIntensity: CGFloat
    let shadowIntensity: CGFloat
    let reflectionIntensity: CGFloat
    let refractionIntensity: CGFloat
    let noiseIntensity: CGFloat
    let causticIntensity: CGFloat
    let dynamicBlurEnabled: Bool
    let dynamicOpacityEnabled: Bool
    let dynamicReflectionEnabled: Bool
    let dynamicLightingEnabled: Bool
    let dynamicBorderEnabled: Bool
    let performanceMode: GlassPerformanceMode
    
    static let `default` = GlassConfiguration(
        blurIntensity: 1.0,
        opacityMultiplier: 1.0,
        highlightIntensity: 1.0,
        borderIntensity: 1.0,
        shadowIntensity: 1.0,
        reflectionIntensity: 1.0,
        refractionIntensity: 1.0,
        noiseIntensity: 1.0,
        causticIntensity: 1.0,
        dynamicBlurEnabled: true,
        dynamicOpacityEnabled: true,
        dynamicReflectionEnabled: true,
        dynamicLightingEnabled: true,
        dynamicBorderEnabled: true,
        performanceMode: .standard
    )
    
    static let performance = GlassConfiguration(
        blurIntensity: 0.7,
        opacityMultiplier: 1.0,
        highlightIntensity: 0.8,
        borderIntensity: 0.8,
        shadowIntensity: 0.8,
        reflectionIntensity: 0.7,
        refractionIntensity: 0.6,
        noiseIntensity: 0.5,
        causticIntensity: 0.3,
        dynamicBlurEnabled: false,
        dynamicOpacityEnabled: false,
        dynamicReflectionEnabled: false,
        dynamicLightingEnabled: false,
        dynamicBorderEnabled: false,
        performanceMode: .performance
    )
    
    static let quality = GlassConfiguration(
        blurIntensity: 1.2,
        opacityMultiplier: 1.0,
        highlightIntensity: 1.2,
        borderIntensity: 1.1,
        shadowIntensity: 1.1,
        reflectionIntensity: 1.2,
        refractionIntensity: 1.1,
        noiseIntensity: 1.0,
        causticIntensity: 1.0,
        dynamicBlurEnabled: true,
        dynamicOpacityEnabled: true,
        dynamicReflectionEnabled: true,
        dynamicLightingEnabled: true,
        dynamicBorderEnabled: true,
        performanceMode: .quality
    )
    
    static let ultraQuality = GlassConfiguration(
        blurIntensity: 1.5,
        opacityMultiplier: 1.0,
        highlightIntensity: 1.3,
        borderIntensity: 1.2,
        shadowIntensity: 1.2,
        reflectionIntensity: 1.3,
        refractionIntensity: 1.2,
        noiseIntensity: 1.0,
        causticIntensity: 1.1,
        dynamicBlurEnabled: true,
        dynamicOpacityEnabled: true,
        dynamicReflectionEnabled: true,
        dynamicLightingEnabled: true,
        dynamicBorderEnabled: true,
        performanceMode: .ultraQuality
    )
}

enum GlassPerformanceMode {
    case performance
    case standard
    case quality
    case ultraQuality
}

struct GlassEnvironmentState: Equatable {
    var isDarkMode: Bool = false
    var isHighContrast: Bool = false
    var isReduceTransparency: Bool = false
    var isReduceMotion: Bool = false
    var lightingDirection: CGFloat = 0.3
    var ambientLight: CGFloat = 1.0
    var environmentBrightness: CGFloat = 1.0
    
    static let `default` = GlassEnvironmentState()
}

struct GlassRenderingContext {
    let materialType: GlassMaterialType
    let cornerRadius: CGFloat
    let configuration: GlassConfiguration
    let colorScheme: ColorScheme
    let reduceTransparency: Bool
    let reduceMotion: Bool
    let motion: DeviceMotionManager
    let environment: GlassEnvironmentState
    
    var adaptiveOpacity: Double {
        var opacity = materialType.opacity
        
        if reduceTransparency {
            opacity = min(opacity * 1.5, 0.5)
        }
        
        opacity = opacity * configuration.opacityMultiplier
        
        if colorScheme == .dark {
            opacity = opacity * 0.8
        }
        
        return opacity
    }
    
    var adaptiveHighlightOpacity: Double {
        var opacity = materialType.edgeHighlightOpacity
        opacity = opacity * configuration.highlightIntensity
        
        if colorScheme == .dark {
            opacity = opacity * 0.7
        }
        
        return opacity
    }
    
    var adaptiveBorderOpacity: Double {
        var opacity = materialType.borderOpacity
        opacity = opacity * configuration.borderIntensity
        
        if colorScheme == .dark {
            opacity = opacity * 0.6
        }
        
        return opacity
    }
    
    var adaptiveShadowOpacity: Double {
        var opacity = materialType.shadowOpacity
        opacity = opacity * configuration.shadowIntensity
        
        if colorScheme == .dark {
            opacity = opacity * 0.5
        }
        
        return opacity
    }
    
    var adaptiveBlurRadius: CGFloat {
        var blur = materialType.blurRadius
        blur = blur * configuration.blurIntensity
        
        if !configuration.dynamicBlurEnabled {
            blur = blur * 0.8
        }
        
        return blur
    }
}

struct GlassRenderingContextKey: EnvironmentKey {
    static let defaultValue: GlassRenderingContext? = nil
}

extension EnvironmentValues {
    var glassRenderingContext: GlassRenderingContext? {
        get { self[GlassRenderingContextKey.self] }
        set { self[GlassRenderingContextKey.self] = newValue }
    }
}
