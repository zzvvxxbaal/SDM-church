import SwiftUI

struct GlassRenderer: ViewModifier {
    let materialType: GlassMaterialType
    let cornerRadius: CGFloat
    let configuration: GlassConfiguration
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @State private var motion = DeviceMotionManager()
    @State private var environment = GlassEnvironmentState()
    
    func body(content: Content) -> some View {
        let context = GlassRenderingContext(
            materialType: materialType,
            cornerRadius: cornerRadius,
            configuration: configuration,
            colorScheme: colorScheme,
            reduceTransparency: reduceTransparency,
            reduceMotion: reduceMotion,
            motion: motion,
            environment: environment
        )
        
        return ZStack {
            content
                .background(
                    GlassRendererBackdrop(context: context)
                )
                .overlay(
                    GlassRendererLighting(context: context)
                )
                .overlay(
                    GlassRendererReflection(context: context, motionX: reduceMotion ? 0 : motion.roll * 80, motionY: reduceMotion ? 0 : motion.pitch * 80)
                )
                .overlay(
                    GlassRendererRefraction(context: context)
                )
                .overlay(
                    GlassRendererHighlight(context: context)
                )
                .overlay(
                    GlassRendererBorder(context: context)
                )
                .overlay(
                    GlassRendererNoise(context: context)
                )
                .overlay(
                    GlassRendererCaustic(context: context)
                )
                .overlay(
                    GlassRendererShadow(context: context)
                )
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: cornerRadius,
                        style: .continuous
                    )
                )
        }
        .environment(\.glassRenderingContext, context)
    }
}

struct GlassRendererBackdrop: View {
    let context: GlassRenderingContext
    
    var body: some View {
        ZStack {
            let baseOpacity = context.adaptiveOpacity
            
            if context.colorScheme == .dark {
                Color.black.opacity(baseOpacity * 0.5)
            } else {
                Color.white.opacity(baseOpacity)
            }
            
            Color.white.opacity(baseOpacity * 0.3)
                .blur(radius: 0.5)
        }
    }
}

struct GlassRendererLighting: View {
    let context: GlassRenderingContext
    
    var body: some View {
        let highlightOpacity = context.adaptiveHighlightOpacity
        
        ZStack {
            RoundedRectangle(cornerRadius: context.cornerRadius, style: .continuous)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.white.opacity(highlightOpacity),
                            Color.white.opacity(highlightOpacity * 0.4)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 0.5
                )
                .blendMode(.screen)
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(highlightOpacity * 0.5),
                    Color.white.opacity(highlightOpacity * 0.15),
                    Color.clear
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .blendMode(.screen)
        }
    }
}

struct GlassRendererReflection: View {
    let context: GlassRenderingContext
    let motionX: CGFloat
    let motionY: CGFloat
    
    var body: some View {
        let shadowOpacity = context.adaptiveShadowOpacity
        
        LinearGradient(
            gradient: Gradient(colors: [
                Color.blue.opacity(shadowOpacity * 0.3),
                Color.cyan.opacity(shadowOpacity * 0.2),
                Color.clear
            ]),
            startPoint: .init(x: 0.5 + motionX / 200, y: 0.5 + motionY / 200),
            endPoint: .init(x: 0.2, y: 0.8)
        )
        .blendMode(.screen)
    }
}

struct GlassRendererRefraction: View {
    let context: GlassRenderingContext
    
    var body: some View {
        RadialGradient(
            gradient: Gradient(colors: [
                Color.white.opacity(context.adaptiveHighlightOpacity * 0.4),
                Color.clear
            ]),
            center: .init(x: 0.5, y: 0.35),
            radius: 0.5
        )
        .blendMode(.colorDodge)
        .opacity(0.5)
    }
}

struct GlassRendererHighlight: View {
    let context: GlassRenderingContext
    
    var body: some View {
        RadialGradient(
            gradient: Gradient(colors: [
                Color.white.opacity(context.adaptiveHighlightOpacity * 0.6),
                Color.clear
            ]),
            center: .init(x: 0.3, y: 0.25),
            radius: 0.4
        )
        .blendMode(.screen)
    }
}

struct GlassRendererBorder: View {
    let context: GlassRenderingContext
    
    var body: some View {
        RoundedRectangle(cornerRadius: context.cornerRadius, style: .continuous)
            .stroke(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.white.opacity(context.adaptiveBorderOpacity),
                        Color.white.opacity(context.adaptiveBorderOpacity * 0.5)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                lineWidth: 1
            )
    }
}

struct GlassRendererNoise: View {
    let context: GlassRenderingContext
    
    var body: some View {
        Color.white.opacity(0.015)
    }
}

struct GlassRendererCaustic: View {
    let context: GlassRenderingContext
    
    var body: some View {
        Canvas { canvasContext, size in
            let shadowOpacity = context.adaptiveShadowOpacity
            let causticColor = Color.white.opacity(shadowOpacity * 0.1)
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
            
            canvasContext.stroke(
                path,
                with: .color(causticColor),
                lineWidth: 0.5
            )
        }
        .blendMode(.screen)
    }
}

struct GlassRendererShadow: View {
    let context: GlassRenderingContext
    
    var body: some View {
        RoundedRectangle(cornerRadius: context.cornerRadius, style: .continuous)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.black.opacity(context.adaptiveShadowOpacity * 0.4),
                        Color.clear
                    ]),
                    startPoint: .bottomTrailing,
                    endPoint: .topLeading
                )
            )
    }
}

extension View {
    func glassRenderer(
        _ materialType: GlassMaterialType = .regular,
        cornerRadius: CGFloat = 16,
        configuration: GlassConfiguration = .default
    ) -> some View {
        modifier(GlassRenderer(materialType: materialType, cornerRadius: cornerRadius, configuration: configuration))
    }
}
