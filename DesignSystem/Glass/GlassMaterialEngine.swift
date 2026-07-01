import SwiftUI

struct GlassMaterialEngine {
    enum Surface {
        case frosted
        case polished
        case matte
        case satin
        case mirror
        case translucent
    }
    
    enum Finish {
        case smooth
        case textured
        case metallic
        case iridescent
    }
    
    static func createMaterial(
        surface: Surface,
        finish: Finish,
        configuration: GlassConfiguration
    ) -> AnyView {
        switch surface {
        case .frosted:
            return AnyView(FrostedGlassMaterial(configuration: configuration, finish: finish))
        case .polished:
            return AnyView(PolishedGlassMaterial(configuration: configuration, finish: finish))
        case .matte:
            return AnyView(MatteGlassMaterial(configuration: configuration, finish: finish))
        case .satin:
            return AnyView(SatinGlassMaterial(configuration: configuration, finish: finish))
        case .mirror:
            return AnyView(MirrorGlassMaterial(configuration: configuration, finish: finish))
        case .translucent:
            return AnyView(TranslucentGlassMaterial(configuration: configuration, finish: finish))
        }
    }
}

struct FrostedGlassMaterial: View {
    let configuration: GlassConfiguration
    let finish: GlassMaterialEngine.Finish
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.15 * configuration.opacityMultiplier)
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(0.1),
                    Color.white.opacity(0.05),
                    Color.clear
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .blur(radius: 2)
            
            Canvas { context, size in
                for i in 0..<Int(size.width / 10) {
                    for j in 0..<Int(size.height / 10) {
                        let x = CGFloat(i) * 10
                        let y = CGFloat(j) * 10
                        let circle = Circle()
                            .path(in: CGRect(x: x, y: y, width: 8, height: 8))
                        context.fill(
                            circle,
                            with: .color(Color.white.opacity(0.02))
                        )
                    }
                }
            }
        }
    }
}

struct PolishedGlassMaterial: View {
    let configuration: GlassConfiguration
    let finish: GlassMaterialEngine.Finish
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.12 * configuration.opacityMultiplier)
            
            RadialGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(0.2),
                    Color.white.opacity(0.05),
                    Color.clear
                ]),
                center: .init(x: 0.3, y: 0.25),
                radius: 0.6
            )
            .blendMode(.screen)
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(0.1),
                    Color.clear
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .blendMode(.colorDodge)
        }
    }
}

struct MatteGlassMaterial: View {
    let configuration: GlassConfiguration
    let finish: GlassMaterialEngine.Finish
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.08 * configuration.opacityMultiplier)
            
            Color.white.opacity(0.03)
                .noise()
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.black.opacity(0.02),
                    Color.clear,
                    Color.black.opacity(0.01)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
    }
}

struct SatinGlassMaterial: View {
    let configuration: GlassConfiguration
    let finish: GlassMaterialEngine.Finish
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.10 * configuration.opacityMultiplier)
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(0.08),
                    Color.white.opacity(0.02),
                    Color.clear
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .blendMode(.screen)
            
            Canvas { context, size in
                var path = Path()
                let step: CGFloat = 2
                var y: CGFloat = 0
                
                while y < size.height {
                    path.move(to: CGPoint(x: 0, y: y))
                    path.addLine(to: CGPoint(x: size.width, y: y))
                    y += step
                }
                
                context.stroke(
                    path,
                    with: .color(Color.white.opacity(0.01)),
                    lineWidth: 0.5
                )
            }
        }
    }
}

struct MirrorGlassMaterial: View {
    let configuration: GlassConfiguration
    let finish: GlassMaterialEngine.Finish
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.20 * configuration.opacityMultiplier)
            
            RadialGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(0.3),
                    Color.white.opacity(0.1),
                    Color.clear
                ]),
                center: .init(x: 0.5, y: 0.5),
                radius: 0.7
            )
            .blendMode(.screen)
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.cyan.opacity(0.1),
                    Color.blue.opacity(0.05),
                    Color.clear
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .blendMode(.lighten)
        }
    }
}

struct TranslucentGlassMaterial: View {
    let configuration: GlassConfiguration
    let finish: GlassMaterialEngine.Finish
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.18 * configuration.opacityMultiplier)
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(0.12),
                    Color.white.opacity(0.06),
                    Color.clear
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            Color.cyan.opacity(0.04)
                .blendMode(.screen)
        }
    }
}

extension View {
    func noise() -> some View {
        self.overlay(
            Canvas { context, size in
                for x in stride(from: 0, to: size.width, by: 2) {
                    for y in stride(from: 0, to: size.height, by: 2) {
                        let opacity = Double.random(in: 0...0.05)
                        let point = CGPoint(x: x, y: y)
                        context.fill(
                            Circle().path(in: CGRect(x: x, y: y, width: 1, height: 1)),
                            with: .color(Color.white.opacity(opacity))
                        )
                    }
                }
            }
            .blendMode(.screen)
        )
    }
    
    func glassWithMaterial(
        surface: GlassMaterialEngine.Surface,
        finish: GlassMaterialEngine.Finish = .smooth,
        configuration: GlassConfiguration = .default,
        cornerRadius: CGFloat = 16
    ) -> some View {
        ZStack {
            self
                .background(
                    GlassMaterialEngine.createMaterial(
                        surface: surface,
                        finish: finish,
                        configuration: configuration
                    )
                )
        }
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
    }
}
