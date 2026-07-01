import SwiftUI

struct GlassDepthEngine: ViewModifier {
    let depthLevel: CGFloat
    let configuration: GlassConfiguration
    
    @State private var motion = DeviceMotionManager()
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .overlay(
                DepthShadowLayer(depthLevel: depthLevel)
            )
            .overlay(
                DepthHighlightLayer(depthLevel: depthLevel, motion: motion)
            )
    }
}

struct DepthShadowLayer: View {
    let depthLevel: CGFloat
    
    var body: some View {
        let shadowOpacity = depthLevel * 0.08
        let shadowRadius = depthLevel * 4
        
        RoundedRectangle(cornerRadius: AppRadius.md, style: .continuous)
            .shadow(
                color: Color.black.opacity(shadowOpacity),
                radius: shadowRadius,
                x: 0,
                y: depthLevel * 2
            )
    }
}

struct DepthHighlightLayer: View {
    let depthLevel: CGFloat
    let motion: DeviceMotionManager
    
    var body: some View {
        let highlightOpacity = (1.0 - depthLevel) * 0.15
        
        RadialGradient(
            gradient: Gradient(colors: [
                Color.white.opacity(highlightOpacity),
                Color.clear
            ]),
            center: .init(
                x: 0.3 + motion.roll * 0.05,
                y: 0.25 + motion.pitch * 0.05
            ),
            radius: 0.4 + depthLevel * 0.2
        )
        .blendMode(.screen)
    }
}

extension View {
    func glassDepth(
        level: CGFloat = 0.5,
        configuration: GlassConfiguration = .default
    ) -> some View {
        modifier(GlassDepthEngine(depthLevel: level, configuration: configuration))
    }
}
