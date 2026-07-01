import SwiftUI

struct GlassRefractionEngine: ViewModifier {
    let configuration: GlassConfiguration
    let cornerRadius: CGFloat = 16
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .overlay(
                DynamicRefractionLayer(
                    configuration: configuration,
                    cornerRadius: cornerRadius,
                    colorScheme: colorScheme
                )
            )
    }
}

struct DynamicRefractionLayer: View {
    let configuration: GlassConfiguration
    let cornerRadius: CGFloat
    let colorScheme: ColorScheme
    
    var body: some View {
        let refractionOpacity = configuration.refractionIntensity * 0.15
        
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(
                    RadialGradient(
                        gradient: Gradient(colors: [
                            Color.white.opacity(refractionOpacity),
                            Color.clear
                        ]),
                        center: .init(x: 0.5, y: 0.35),
                        radius: 0.6
                    )
                )
                .blendMode(.colorDodge)
            
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.white.opacity(refractionOpacity * 0.5),
                            Color.clear
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1
                )
                .blendMode(.lighten)
        }
        .opacity(0.6)
    }
}

extension View {
    func glassRefraction(
        configuration: GlassConfiguration = .default,
        cornerRadius: CGFloat = 16
    ) -> some View {
        modifier(GlassRefractionEngine(configuration: configuration, cornerRadius: cornerRadius))
    }
}
