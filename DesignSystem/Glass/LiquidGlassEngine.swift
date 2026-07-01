import SwiftUI

enum GlassMaterialType {
    case ultraThin
    case thin
    case regular
    case thick
    case toolbar
    case navigation
    case floating
    case card
    case capsule
    case circle
    case button
    
    var blurRadius: CGFloat {
        switch self {
        case .ultraThin: return 20
        case .thin: return 30
        case .regular: return 40
        case .thick: return 50
        case .toolbar: return 35
        case .navigation: return 45
        case .floating: return 38
        case .card: return 42
        case .capsule: return 28
        case .circle: return 32
        case .button: return 25
        }
    }
    
    var opacity: Double {
        switch self {
        case .ultraThin: return 0.08
        case .thin: return 0.15
        case .regular: return 0.25
        case .thick: return 0.35
        case .toolbar: return 0.22
        case .navigation: return 0.28
        case .floating: return 0.20
        case .card: return 0.32
        case .capsule: return 0.18
        case .circle: return 0.24
        case .button: return 0.20
        }
    }
    
    var edgeHighlightOpacity: Double {
        switch self {
        case .ultraThin: return 0.28
        case .thin: return 0.32
        case .regular: return 0.35
        case .thick: return 0.38
        case .toolbar: return 0.34
        case .navigation: return 0.36
        case .floating: return 0.33
        case .card: return 0.37
        case .capsule: return 0.30
        case .circle: return 0.31
        case .button: return 0.29
        }
    }
    
    var borderOpacity: Double {
        switch self {
        case .ultraThin: return 0.18
        case .thin: return 0.22
        case .regular: return 0.28
        case .thick: return 0.35
        case .toolbar: return 0.25
        case .navigation: return 0.30
        case .floating: return 0.24
        case .card: return 0.32
        case .capsule: return 0.20
        case .circle: return 0.21
        case .button: return 0.23
        }
    }
    
    var shadowOpacity: Double {
        switch self {
        case .ultraThin: return 0.04
        case .thin: return 0.08
        case .regular: return 0.12
        case .thick: return 0.16
        case .toolbar: return 0.10
        case .navigation: return 0.14
        case .floating: return 0.15
        case .card: return 0.13
        case .capsule: return 0.06
        case .circle: return 0.08
        case .button: return 0.07
        }
    }
}

struct LiquidGlassEngine: ViewModifier {
    let materialType: GlassMaterialType
    let cornerRadius: CGFloat
    let configuration: GlassConfiguration
    @State private var motion = DeviceMotionManager()
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    init(
        materialType: GlassMaterialType,
        cornerRadius: CGFloat,
        configuration: GlassConfiguration = .default
    ) {
        self.materialType = materialType
        self.cornerRadius = cornerRadius
        self.configuration = configuration
    }
    
    func body(content: Content) -> some View {
        let adaptiveConfig = createAdaptiveConfiguration()
        let motionX = reduceMotion ? 0 : (motion.roll * 80)
        let motionY = reduceMotion ? 0 : (motion.pitch * 80)
        
        return content
            .background(
                GlassBackdrop(materialType: materialType)
                    .opacity(materialType.opacity * adaptiveConfig.opacityMultiplier)
            )
            .overlay(
                GlassEdgeHighlight(
                    materialType: materialType,
                    cornerRadius: cornerRadius
                )
                .opacity(adaptiveConfig.highlightIntensity)
            )
            .overlay(
                GlassInnerGlow(materialType: materialType)
                .opacity(adaptiveConfig.highlightIntensity * 0.8)
            )
            .overlay(
                GlassSpecularHighlight(materialType: materialType)
                .opacity(adaptiveConfig.highlightIntensity * 0.6)
            )
            .overlay(
                GlassEnvironmentMirror(
                    x: motionX,
                    y: motionY,
                    materialType: materialType
                )
                .opacity(adaptiveConfig.reflectionIntensity)
            )
            .overlay(
                GlassDynamicShadow(materialType: materialType, cornerRadius: cornerRadius)
                .opacity(adaptiveConfig.shadowIntensity)
            )
            .overlay(
                GlassBorderStroke(materialType: materialType, cornerRadius: cornerRadius)
                .opacity(adaptiveConfig.borderIntensity)
            )
            .overlay(
                GlassNoiseDynamic(materialType: materialType)
                .opacity(adaptiveConfig.noiseIntensity)
            )
            .overlay(
                GlassCausticEffect(materialType: materialType)
                .opacity(adaptiveConfig.causticIntensity)
            )
            .clipShape(
                RoundedRectangle(
                    cornerRadius: cornerRadius,
                    style: .continuous
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
    func liquidGlass(
        _ materialType: GlassMaterialType = .regular,
        cornerRadius: CGFloat = 16
    ) -> some View {
        modifier(LiquidGlassEngine(materialType: materialType, cornerRadius: cornerRadius))
    }
}

struct GlassBackdrop: View {
    let materialType: GlassMaterialType
    
    var body: some View {
        ZStack {
            Color.white.opacity(materialType.opacity)
            
            Color.white.opacity(materialType.opacity * 0.3)
                .blur(radius: 0.5)
        }
    }
}

struct GlassEdgeHighlight: View {
    let materialType: GlassMaterialType
    let cornerRadius: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .stroke(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.white.opacity(materialType.edgeHighlightOpacity),
                        Color.white.opacity(materialType.edgeHighlightOpacity * 0.4)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                lineWidth: 0.5
            )
            .blendMode(.screen)
    }
}

struct GlassInnerGlow: View {
    let materialType: GlassMaterialType
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.white.opacity(materialType.edgeHighlightOpacity * 0.5),
                Color.white.opacity(materialType.edgeHighlightOpacity * 0.15),
                Color.clear
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .blendMode(.screen)
    }
}

struct GlassSpecularHighlight: View {
    let materialType: GlassMaterialType
    
    var body: some View {
        RadialGradient(
            gradient: Gradient(colors: [
                Color.white.opacity(materialType.edgeHighlightOpacity * 0.6),
                Color.clear
            ]),
            center: .init(x: 0.3, y: 0.25),
            radius: 0.4
        )
        .blendMode(.screen)
    }
}

struct GlassEnvironmentMirror: View {
    let x: CGFloat
    let y: CGFloat
    let materialType: GlassMaterialType
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.blue.opacity(materialType.shadowOpacity * 0.3),
                Color.cyan.opacity(materialType.shadowOpacity * 0.2),
                Color.clear
            ]),
            startPoint: .init(x: 0.5 + x / 200, y: 0.5 + y / 200),
            endPoint: .init(x: 0.2, y: 0.8)
        )
        .blendMode(.screen)
    }
}

struct GlassDynamicShadow: View {
    let materialType: GlassMaterialType
    let cornerRadius: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.black.opacity(materialType.shadowOpacity * 0.4),
                        Color.clear
                    ]),
                    startPoint: .bottomTrailing,
                    endPoint: .topLeading
                )
            )
    }
}

struct GlassBorderStroke: View {
    let materialType: GlassMaterialType
    let cornerRadius: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .stroke(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.white.opacity(materialType.borderOpacity),
                        Color.white.opacity(materialType.borderOpacity * 0.5)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                lineWidth: 1
            )
    }
}

struct GlassNoiseDynamic: View {
    let materialType: GlassMaterialType
    
    var body: some View {
        Color.white.opacity(0.015)
    }
}

struct GlassCausticEffect: View {
    let materialType: GlassMaterialType
    
    var body: some View {
        Canvas { context, size in
            let causticColor = Color.white.opacity(materialType.shadowOpacity * 0.1)
            var path = Path()
            
            let step = 4.0
            var y = 0.0
            
            while y < size.height {
                path.move(to: CGPoint(x: 0, y: y))
                path.addCurve(
                    to: CGPoint(x: size.width, y: y),
                    control1: CGPoint(x: size.width * 0.25, y: y - 2),
                    control2: CGPoint(x: size.width * 0.75, y: y + 2)
                )
                y += step
            }
            
            context.stroke(
                path,
                with: .color(causticColor),
                lineWidth: 0.5
            )
        }
        .blendMode(.screen)
    }
}
