import SwiftUI

struct GlassReflectionEngine: ViewModifier {
    let configuration: GlassConfiguration
    @State private var motion = DeviceMotionManager()
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .overlay(
                DynamicReflectionLayer(
                    configuration: configuration,
                    motion: motion,
                    colorScheme: colorScheme
                )
            )
    }
}

struct DynamicReflectionLayer: View {
    let configuration: GlassConfiguration
    let motion: DeviceMotionManager
    let colorScheme: ColorScheme
    
    var body: some View {
        let reflectionOpacity = configuration.reflectionIntensity * 0.3
        let motionInfluence = configuration.dynamicReflectionEnabled ? 1.0 : 0.0
        
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.cyan.opacity(reflectionOpacity * 0.4),
                    Color.blue.opacity(reflectionOpacity * 0.2),
                    Color.clear
                ]),
                startPoint: .init(
                    x: 0.5 + (motion.roll * 0.1 * motionInfluence),
                    y: 0.5 + (motion.pitch * 0.1 * motionInfluence)
                ),
                endPoint: .init(x: 0.2, y: 0.8)
            )
            
            if colorScheme == .dark {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.white.opacity(reflectionOpacity * 0.15),
                        Color.clear
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            }
        }
        .blendMode(.screen)
    }
}

extension View {
    func glassReflection(
        configuration: GlassConfiguration = .default
    ) -> some View {
        modifier(GlassReflectionEngine(configuration: configuration))
    }
}
