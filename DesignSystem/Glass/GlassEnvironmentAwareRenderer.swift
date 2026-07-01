import SwiftUI

struct GlassEnvironmentAwareRenderer: ViewModifier {
    let materialType: GlassMaterialType
    let cornerRadius: CGFloat
    let configuration: GlassConfiguration
    
    @State private var environment = GlassEnvironment.shared
    @State private var motion = DeviceMotionManager()
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        let dynamicOpacity = materialType.opacity * environment.ambientLighting
        
        return ZStack {
            content
                .background(
                    GlassEnvironmentBackdrop(
                        materialType: materialType,
                        configuration: configuration,
                        environment: environment,
                        opacity: dynamicOpacity
                    )
                )
                .overlay(
                    GlassEnvironmentDynamicLighting(
                        materialType: materialType,
                        configuration: configuration,
                        environment: environment,
                        motion: motion
                    )
                )
                .overlay(
                    GlassEnvironmentReflections(
                        materialType: materialType,
                        configuration: configuration,
                        environment: environment,
                        motion: motion
                    )
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                )
        }
        .onAppear {
            environment.updateForColorScheme(colorScheme)
        }
        .onChange(of: colorScheme) { oldValue, newValue in
            environment.updateForColorScheme(newValue)
        }
    }
}

struct GlassEnvironmentBackdrop: View {
    let materialType: GlassMaterialType
    let configuration: GlassConfiguration
    let environment: GlassEnvironment
    let opacity: Double
    
    var body: some View {
        ZStack {
            if environment.isDarkMode {
                Color.black.opacity(opacity * 0.5 * environment.ambientLighting)
            } else {
                Color.white.opacity(opacity * environment.ambientLighting)
            }
            
            Color.white.opacity(opacity * 0.3 * (1.0 - environment.ambientLighting * 0.5))
                .blur(radius: 0.5)
        }
    }
}

struct GlassEnvironmentDynamicLighting: View {
    let materialType: GlassMaterialType
    let configuration: GlassConfiguration
    let environment: GlassEnvironment
    let motion: DeviceMotionManager
    
    var body: some View {
        let lightingEffect = configuration.dynamicLightingEnabled ? 1.0 : 0.5
        let highlightOpacity = materialType.edgeHighlightOpacity * lightingEffect * (1.0 + environment.ambientLighting * 0.3)
        
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(highlightOpacity * 0.8),
                    Color.white.opacity(highlightOpacity * 0.3),
                    Color.clear
                ]),
                startPoint: .init(
                    x: 0.5 + environment.lightingDirection.x * 0.2,
                    y: 0.5 + environment.lightingDirection.y * 0.2
                ),
                endPoint: .bottomTrailing
            )
            .blendMode(.screen)
            
            RadialGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(highlightOpacity * 0.5),
                    Color.clear
                ]),
                center: .init(x: 0.3, y: 0.25),
                radius: 0.4
            )
            .blendMode(.screen)
            .opacity(environment.ambientLighting)
        }
    }
}

struct GlassEnvironmentReflections: View {
    let materialType: GlassMaterialType
    let configuration: GlassConfiguration
    let environment: GlassEnvironment
    let motion: DeviceMotionManager
    
    var body: some View {
        let reflectionEnabled = configuration.dynamicReflectionEnabled
        let reflectionOpacity = materialType.shadowOpacity * 0.3 * (reflectionEnabled ? 1.0 : 0.3)
        
        LinearGradient(
            gradient: Gradient(colors: [
                Color.cyan.opacity(reflectionOpacity),
                Color.blue.opacity(reflectionOpacity * 0.6),
                Color.clear
            ]),
            startPoint: .init(
                x: 0.5 + (reflectionEnabled ? motion.roll * 0.1 : 0),
                y: 0.5 + (reflectionEnabled ? motion.pitch * 0.1 : 0)
            ),
            endPoint: .bottomLeading
        )
        .blendMode(.screen)
        .opacity(environment.ambientLighting * 0.8)
    }
}

extension View {
    func glassEnvironmentAware(
        _ materialType: GlassMaterialType = .regular,
        cornerRadius: CGFloat = 16,
        configuration: GlassConfiguration = .default
    ) -> some View {
        modifier(
            GlassEnvironmentAwareRenderer(
                materialType: materialType,
                cornerRadius: cornerRadius,
                configuration: configuration
            )
        )
    }
}
