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
    @State private var motion = DeviceMotionManager()
    
    func body(content: Content) -> some View {
        content
            .background(
                GlassBackdrop(materialType: materialType)
            )
            .overlay(
                GlassEdgeHighlight(materialType: materialType, cornerRadius: cornerRadius)
            )
            .overlay(
                GlassInnerGlow(materialType: materialType)
            )
            .overlay(
                GlassSpecularHighlight(materialType: materialType)
            )
            .overlay(
                GlassEnvironmentMirror(
                    x: motion.roll * 80,
                    y: motion.pitch * 80,
                    materialType: materialType
                )
            )
            .overlay(
                GlassDynamicShadow(materialType: materialType, cornerRadius: cornerRadius)
            )
            .overlay(
                GlassBorderStroke(materialType: materialType, cornerRadius: cornerRadius)
            )
            .overlay(
                GlassNoiseDynamic(materialType: materialType)
            )
            .overlay(
                GlassCausticEffect(materialType: materialType)
            )
            .clipShape(
                RoundedRectangle(
                    cornerRadius: cornerRadius,
                    style: .continuous
                )
            )
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
