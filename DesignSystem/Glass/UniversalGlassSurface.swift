import SwiftUI

struct UniversalGlassSurface: ViewModifier {
    let configuration: GlassConfiguration
    let cornerRadius: CGFloat
    let shadowConfig: GlassShadowConfig?
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .background(
                    BackdropLayer(
                        configuration: configuration,
                        colorScheme: colorScheme
                    )
                )
                .overlay(
                    LightingLayer(
                        configuration: configuration,
                        colorScheme: colorScheme
                    )
                )
                .overlay(
                    ReflectionLayer(
                        configuration: configuration,
                        reduceMotion: reduceMotion
                    )
                )
                .overlay(
                    RefractionLayer(
                        configuration: configuration
                    )
                )
                .overlay(
                    HighlightLayer(
                        configuration: configuration
                    )
                )
                .overlay(
                    BorderLayer(
                        configuration: configuration,
                        cornerRadius: cornerRadius
                    )
                )
                .overlay(
                    NoiseLayer(
                        configuration: configuration
                    )
                )
                .overlay(
                    CausticLayer(
                        configuration: configuration
                    )
                )
                .overlay(
                    ShadowOverlay(
                        configuration: configuration,
                        cornerRadius: cornerRadius
                    )
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                )
        }
        .if(shadowConfig != nil) { view in
            view.shadow(
                color: AppShadow.color,
                radius: shadowConfig?.radius ?? 16,
                x: shadowConfig?.offset.width ?? 0,
                y: shadowConfig?.offset.height ?? 8
            )
        }
    }
}

struct BackdropLayer: View {
    let configuration: GlassConfiguration
    let colorScheme: ColorScheme
    
    var body: some View {
        ZStack {
            if colorScheme == .dark {
                Color.black.opacity(0.3 * configuration.opacityMultiplier * 0.8)
            } else {
                Color.white.opacity(0.2 * configuration.opacityMultiplier)
            }
            
            Color.white.opacity(0.1 * configuration.opacityMultiplier * 0.3)
                .blur(radius: 0.5)
        }
    }
}

struct LightingLayer: View {
    let configuration: GlassConfiguration
    let colorScheme: ColorScheme
    
    var body: some View {
        let opacity = 0.32 * configuration.highlightIntensity * (colorScheme == .dark ? 0.7 : 1.0)
        
        ZStack {
            RoundedRectangle(cornerRadius: AppRadius.small, style: .continuous)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.white.opacity(opacity),
                            Color.white.opacity(opacity * 0.4)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 0.5
                )
                .blendMode(.screen)
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(opacity * 0.5),
                    Color.white.opacity(opacity * 0.15),
                    Color.clear
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .blendMode(.screen)
        }
    }
}

struct ReflectionLayer: View {
    let configuration: GlassConfiguration
    let reduceMotion: Bool
    
    @State private var motion = DeviceMotionManager()
    
    var body: some View {
        let reflectionOpacity = 0.08 * configuration.reflectionIntensity * (configuration.dynamicReflectionEnabled && !reduceMotion ? 1.0 : 0.5)
        
        LinearGradient(
            gradient: Gradient(colors: [
                Color.blue.opacity(reflectionOpacity * 0.3),
                Color.cyan.opacity(reflectionOpacity * 0.2),
                Color.clear
            ]),
            startPoint: .init(
                x: 0.5 + (configuration.dynamicReflectionEnabled && !reduceMotion ? motion.roll * 0.1 : 0),
                y: 0.5 + (configuration.dynamicReflectionEnabled && !reduceMotion ? motion.pitch * 0.1 : 0)
            ),
            endPoint: .init(x: 0.2, y: 0.8)
        )
        .blendMode(.screen)
    }
}

struct RefractionLayer: View {
    let configuration: GlassConfiguration
    
    var body: some View {
        RadialGradient(
            gradient: Gradient(colors: [
                Color.white.opacity(0.15 * configuration.refractionIntensity),
                Color.clear
            ]),
            center: .init(x: 0.5, y: 0.35),
            radius: 0.5
        )
        .blendMode(.colorDodge)
        .opacity(0.5)
    }
}

struct HighlightLayer: View {
    let configuration: GlassConfiguration
    
    var body: some View {
        RadialGradient(
            gradient: Gradient(colors: [
                Color.white.opacity(0.36 * configuration.highlightIntensity * 0.6),
                Color.clear
            ]),
            center: .init(x: 0.3, y: 0.25),
            radius: 0.4
        )
        .blendMode(.screen)
    }
}

struct BorderLayer: View {
    let configuration: GlassConfiguration
    let cornerRadius: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .stroke(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.white.opacity(0.28 * configuration.borderIntensity),
                        Color.white.opacity(0.28 * configuration.borderIntensity * 0.5)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                lineWidth: 1
            )
    }
}

struct NoiseLayer: View {
    let configuration: GlassConfiguration
    
    var body: some View {
        Color.white.opacity(0.015 * configuration.noiseIntensity)
    }
}

struct CausticLayer: View {
    let configuration: GlassConfiguration
    
    var body: some View {
        Canvas { context, size in
            let causticOpacity = 0.08 * configuration.causticIntensity
            let causticColor = Color.white.opacity(causticOpacity * 0.1)
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

struct ShadowOverlay: View {
    let configuration: GlassConfiguration
    let cornerRadius: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.black.opacity(0.12 * configuration.shadowIntensity * 0.4),
                        Color.clear
                    ]),
                    startPoint: .bottomTrailing,
                    endPoint: .topLeading
                )
            )
    }
}

extension View {
    func universalGlass(
        configuration: GlassConfiguration = .default,
        cornerRadius: CGFloat = 16,
        shadowConfig: GlassShadowConfig? = nil
    ) -> some View {
        modifier(
            UniversalGlassSurface(
                configuration: configuration,
                cornerRadius: cornerRadius,
                shadowConfig: shadowConfig
            )
        )
    }
    
    @ViewBuilder
    func `if`<T>(_ condition: Bool, transform: (Self) -> T) -> some View where T: View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
