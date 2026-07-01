import SwiftUI

struct GlassLightingSystem {
    struct EdgeHighlight {
        let opacity: Double
        let startPoint: UnitPoint
        let endPoint: UnitPoint
        let blendMode: BlendMode
        
        init(
            opacity: Double = 0.3,
            startPoint: UnitPoint = .topLeading,
            endPoint: UnitPoint = .bottomTrailing,
            blendMode: BlendMode = .screen
        ) {
            self.opacity = opacity
            self.startPoint = startPoint
            self.endPoint = endPoint
            self.blendMode = blendMode
        }
        
        func view(cornerRadius: CGFloat) -> some View {
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.white.opacity(opacity),
                            Color.white.opacity(opacity * 0.3)
                        ]),
                        startPoint: startPoint,
                        endPoint: endPoint
                    ),
                    lineWidth: 0.5
                )
                .blendMode(blendMode)
        }
    }
    
    struct InnerGlow {
        let opacity: Double
        let centerColor: Color
        let edgeColor: Color
        let blendMode: BlendMode
        
        init(
            opacity: Double = 0.15,
            centerColor: Color = .white,
            edgeColor: Color = .clear,
            blendMode: BlendMode = .screen
        ) {
            self.opacity = opacity
            self.centerColor = centerColor
            self.edgeColor = edgeColor
            self.blendMode = blendMode
        }
        
        var view: some View {
            LinearGradient(
                gradient: Gradient(colors: [
                    centerColor.opacity(opacity),
                    centerColor.opacity(opacity * 0.5),
                    edgeColor
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .blendMode(blendMode)
        }
    }
    
    struct SpecularHighlight {
        let opacity: Double
        let position: UnitPoint
        let radius: CGFloat
        let blendMode: BlendMode
        
        init(
            opacity: Double = 0.4,
            position: UnitPoint = .init(x: 0.3, y: 0.25),
            radius: CGFloat = 0.4,
            blendMode: BlendMode = .screen
        ) {
            self.opacity = opacity
            self.position = position
            self.radius = radius
            self.blendMode = blendMode
        }
        
        var view: some View {
            RadialGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(opacity),
                    Color.clear
                ]),
                center: position,
                radius: radius
            )
            .blendMode(blendMode)
        }
    }
    
    struct EnvironmentReflection {
        let x: CGFloat
        let y: CGFloat
        let opacity: Double
        let blendMode: BlendMode
        
        init(
            x: CGFloat = 0,
            y: CGFloat = 0,
            opacity: Double = 0.1,
            blendMode: BlendMode = .screen
        ) {
            self.x = x
            self.y = y
            self.opacity = opacity
            self.blendMode = blendMode
        }
        
        var view: some View {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.blue.opacity(opacity * 0.3),
                    Color.cyan.opacity(opacity * 0.2),
                    Color.clear
                ]),
                startPoint: .init(x: 0.5 + x / 200, y: 0.5 + y / 200),
                endPoint: .init(x: 0.2, y: 0.8)
            )
            .blendMode(blendMode)
        }
    }
    
    struct DynamicShadow {
        let opacity: Double
        let direction: UnitPoint
        let blendMode: BlendMode
        
        init(
            opacity: Double = 0.08,
            direction: UnitPoint = .bottomTrailing,
            blendMode: BlendMode = .multiply
        ) {
            self.opacity = opacity
            self.direction = direction
            self.blendMode = blendMode
        }
        
        func view(cornerRadius: CGFloat) -> some View {
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.black.opacity(opacity),
                            Color.clear
                        ]),
                        startPoint: direction,
                        endPoint: UnitPoint(x: 1 - direction.x, y: 1 - direction.y)
                    )
                )
                .blendMode(blendMode)
        }
    }
    
    struct GlassBorder {
        let opacity: Double
        let color: Color
        let lineWidth: CGFloat
        let blendMode: BlendMode
        
        init(
            opacity: Double = 0.25,
            color: Color = .white,
            lineWidth: CGFloat = 1,
            blendMode: BlendMode = .screen
        ) {
            self.opacity = opacity
            self.color = color
            self.lineWidth = lineWidth
            self.blendMode = blendMode
        }
        
        func view(cornerRadius: CGFloat) -> some View {
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            color.opacity(opacity),
                            color.opacity(opacity * 0.5)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: lineWidth
                )
                .blendMode(blendMode)
        }
    }
    
    struct DynamicOpacity {
        let minOpacity: Double
        let maxOpacity: Double
        let animationDuration: Double
        
        init(
            minOpacity: Double = 0.5,
            maxOpacity: Double = 1.0,
            animationDuration: Double = 2.0
        ) {
            self.minOpacity = minOpacity
            self.maxOpacity = maxOpacity
            self.animationDuration = animationDuration
        }
        
        @ViewBuilder
        func view<Content: View>(@ViewBuilder content: () -> Content) -> some View {
            DynamicOpacityView(
                minOpacity: minOpacity,
                maxOpacity: maxOpacity,
                animationDuration: animationDuration,
                content: content
            )
        }
    }
}

struct DynamicOpacityView<Content: View>: View {
    let minOpacity: Double
    let maxOpacity: Double
    let animationDuration: Double
    let content: () -> Content
    
    @State private var isVisible = true
    
    var body: some View {
        content()
            .opacity(isVisible ? maxOpacity : minOpacity)
            .animation(
                Animation.easeInOut(duration: animationDuration).repeatForever(autoreverses: true),
                value: isVisible
            )
            .onAppear {
                isVisible = false
            }
    }
}

extension View {
    func glassEdgeHighlight(
        opacity: Double = 0.3,
        cornerRadius: CGFloat = 16
    ) -> some View {
        overlay(
            GlassLightingSystem.EdgeHighlight(opacity: opacity)
                .view(cornerRadius: cornerRadius)
        )
    }
    
    func glassInnerGlow(
        opacity: Double = 0.15
    ) -> some View {
        overlay(
            GlassLightingSystem.InnerGlow(opacity: opacity).view
        )
    }
    
    func glassSpecularHighlight(
        opacity: Double = 0.4
    ) -> some View {
        overlay(
            GlassLightingSystem.SpecularHighlight(opacity: opacity).view
        )
    }
    
    func glassDynamicShadow(
        opacity: Double = 0.08,
        cornerRadius: CGFloat = 16
    ) -> some View {
        overlay(
            GlassLightingSystem.DynamicShadow(opacity: opacity)
                .view(cornerRadius: cornerRadius)
        )
    }
    
    func glassBorder(
        opacity: Double = 0.25,
        cornerRadius: CGFloat = 16
    ) -> some View {
        overlay(
            GlassLightingSystem.GlassBorder(opacity: opacity)
                .view(cornerRadius: cornerRadius)
        )
    }
}
