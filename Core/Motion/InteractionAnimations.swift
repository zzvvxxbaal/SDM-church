import SwiftUI

// MARK: - Button Press Animation

public struct ButtonPressAnimation: ViewModifier {
    let isPressed: Bool
    let scale: CGFloat
    let opacity: Double
    let hapticFeedback: Bool
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(
        isPressed: Bool,
        scale: CGFloat = 0.95,
        opacity: Double = 0.8,
        hapticFeedback: Bool = true
    ) {
        self.isPressed = isPressed
        self.scale = scale
        self.opacity = opacity
        self.hapticFeedback = hapticFeedback
    }
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(isPressed ? scale : 1.0)
            .opacity(isPressed ? opacity : 1.0)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.3, dampingFraction: 0.7),
                value: isPressed
            )
            .onChange(of: isPressed) { old, new in
                if hapticFeedback && new {
                    HapticFeedback.buttonPress()
                }
            }
    }
}

// MARK: - Card Press Animation

public struct CardPressAnimation: ViewModifier {
    let isPressed: Bool
    let depth: CGFloat
    let rotationX: Double
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(
        isPressed: Bool,
        depth: CGFloat = 8,
        rotationX: Double = 1.5
    ) {
        self.isPressed = isPressed
        self.depth = depth
        self.rotationX = rotationX
    }
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(isPressed ? 0.98 : 1.0)
            .rotation3DEffect(
                .degrees(isPressed ? rotationX : 0),
                axis: (x: 1, y: 0, z: 0)
            )
            .shadow(
                color: Color.black.opacity(isPressed ? 0.15 : 0.08),
                radius: isPressed ? 12 : 6,
                x: 0,
                y: isPressed ? depth : 2
            )
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.35, dampingFraction: 0.75),
                value: isPressed
            )
    }
}

// MARK: - Card Lift Animation

public struct CardLiftAnimation: ViewModifier {
    let isHovering: Bool
    let elevation: CGFloat
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(isHovering: Bool, elevation: CGFloat = 12) {
        self.isHovering = isHovering
        self.elevation = elevation
    }
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(isHovering ? 1.02 : 1.0)
            .offset(y: isHovering ? -elevation : 0)
            .shadow(
                color: Color.black.opacity(isHovering ? 0.2 : 0.1),
                radius: isHovering ? 16 : 8,
                x: 0,
                y: isHovering ? 12 : 4
            )
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.4, dampingFraction: 0.8),
                value: isHovering
            )
    }
}

// MARK: - Card Expand Animation

public struct CardExpandAnimation: ViewModifier {
    let isExpanded: Bool
    let scale: CGFloat
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(isExpanded: Bool, scale: CGFloat = 1.05) {
        self.isExpanded = isExpanded
        self.scale = scale
    }
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(isExpanded ? scale : 1.0)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.5, dampingFraction: 0.85),
                value: isExpanded
            )
    }
}

// MARK: - Card Collapse Animation

public struct CardCollapseAnimation: ViewModifier {
    let isCollapsed: Bool
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(isCollapsed: Bool) {
        self.isCollapsed = isCollapsed
    }
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(isCollapsed ? 0.95 : 1.0)
            .opacity(isCollapsed ? 0.9 : 1.0)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.4, dampingFraction: 0.8),
                value: isCollapsed
            )
    }
}

// MARK: - Hero Expand Animation

public struct HeroExpandAnimation: ViewModifier {
    let isExpanded: Bool
    let scale: CGFloat
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(isExpanded: Bool, scale: CGFloat = 1.1) {
        self.isExpanded = isExpanded
        self.scale = scale
    }
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(isExpanded ? scale : 1.0)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.6, dampingFraction: 0.85),
                value: isExpanded
            )
    }
}

// MARK: - Hero Collapse Animation

public struct HeroCollapseAnimation: ViewModifier {
    let isCollapsed: Bool
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(isCollapsed: Bool) {
        self.isCollapsed = isCollapsed
    }
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(isCollapsed ? 0.9 : 1.0)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.5, dampingFraction: 0.85),
                value: isCollapsed
            )
    }
}

// MARK: - Floating Animation

public struct FloatingAnimation: ViewModifier {
    @State private var isFloating = false
    let offset: CGFloat
    let duration: Double
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(offset: CGFloat = 8, duration: Double = 2.0) {
        self.offset = offset
        self.duration = duration
    }
    
    public func body(content: Content) -> some View {
        content
            .offset(y: isFloating ? offset : -offset)
            .animation(
                reduceMotion ? 
                .linear(duration: 0.01) :
                .easeInOut(duration: duration).repeatForever(autoreverses: true),
                value: isFloating
            )
            .onAppear {
                if !reduceMotion {
                    isFloating = true
                }
            }
    }
}

// MARK: - Breathing Animation

public struct BreathingAnimation: ViewModifier {
    @State private var isBreathing = false
    let minScale: CGFloat
    let maxScale: CGFloat
    let duration: Double
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(minScale: CGFloat = 0.95, maxScale: CGFloat = 1.05, duration: Double = 3.0) {
        self.minScale = minScale
        self.maxScale = maxScale
        self.duration = duration
    }
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(isBreathing ? maxScale : minScale)
            .animation(
                reduceMotion ? 
                .linear(duration: 0.01) :
                .easeInOut(duration: duration).repeatForever(autoreverses: true),
                value: isBreathing
            )
            .onAppear {
                if !reduceMotion {
                    isBreathing = true
                }
            }
    }
}

// MARK: - Pulse Animation

public struct PulseAnimation: ViewModifier {
    @State private var isPulsing = false
    let intensity: Double
    let duration: Double
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(intensity: Double = 0.3, duration: Double = 1.5) {
        self.intensity = intensity
        self.duration = duration
    }
    
    public func body(content: Content) -> some View {
        content
            .opacity(isPulsing ? 1.0 - intensity : 1.0)
            .animation(
                reduceMotion ? 
                .linear(duration: 0.01) :
                .easeInOut(duration: duration).repeatForever(autoreverses: true),
                value: isPulsing
            )
            .onAppear {
                if !reduceMotion {
                    isPulsing = true
                }
            }
    }
}

// MARK: - Bounce Animation

public struct BounceAnimation: ViewModifier {
    @State private var bounce: CGFloat = 0
    let height: CGFloat
    let duration: Double
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(height: CGFloat = 10, duration: Double = 0.6) {
        self.height = height
        self.duration = duration
    }
    
    public func body(content: Content) -> some View {
        content
            .offset(y: bounce)
            .animation(
                reduceMotion ? 
                .linear(duration: 0.01) :
                .easeInOut(duration: duration).repeatForever(autoreverses: true),
                value: bounce
            )
            .onAppear {
                if !reduceMotion {
                    bounce = height
                }
            }
    }
}

// MARK: - Fade Animation

public struct FadeAnimation: ViewModifier {
    let isVisible: Bool
    let duration: Double
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(isVisible: Bool, duration: Double = 0.3) {
        self.isVisible = isVisible
        self.duration = duration
    }
    
    public func body(content: Content) -> some View {
        content
            .opacity(isVisible ? 1.0 : 0.0)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .easeInOut(duration: duration),
                value: isVisible
            )
    }
}

// MARK: - Scale Animation

public struct ScaleAnimation: ViewModifier {
    let scale: CGFloat
    let duration: Double
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(scale: CGFloat = 1.0, duration: Double = 0.3) {
        self.scale = scale
        self.duration = duration
    }
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .easeInOut(duration: duration),
                value: scale
            )
    }
}

// MARK: - Blur Animation

public struct BlurAnimation: ViewModifier {
    let blurAmount: CGFloat
    let duration: Double
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(blurAmount: CGFloat = 0, duration: Double = 0.3) {
        self.blurAmount = blurAmount
        self.duration = duration
    }
    
    public func body(content: Content) -> some View {
        content
            .blur(radius: blurAmount)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .easeInOut(duration: duration),
                value: blurAmount
            )
    }
}

// MARK: - Depth Shift Animation

public struct DepthShiftAnimation: ViewModifier {
    let depthOffset: CGFloat
    let rotationX: Double
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(depthOffset: CGFloat = 0, rotationX: Double = 0) {
        self.depthOffset = depthOffset
        self.rotationX = rotationX
    }
    
    public func body(content: Content) -> some View {
        content
            .offset(z: depthOffset)
            .rotation3DEffect(
                .degrees(rotationX),
                axis: (x: 1, y: 0, z: 0)
            )
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.4, dampingFraction: 0.8),
                value: depthOffset
            )
    }
}

// MARK: - View Extensions

extension View {
    public func buttonPress(
        isPressed: Bool,
        scale: CGFloat = 0.95,
        opacity: Double = 0.8,
        hapticFeedback: Bool = true
    ) -> some View {
        modifier(ButtonPressAnimation(
            isPressed: isPressed,
            scale: scale,
            opacity: opacity,
            hapticFeedback: hapticFeedback
        ))
    }
    
    public func cardPress(isPressed: Bool, depth: CGFloat = 8, rotationX: Double = 1.5) -> some View {
        modifier(CardPressAnimation(isPressed: isPressed, depth: depth, rotationX: rotationX))
    }
    
    public func cardLift(isHovering: Bool, elevation: CGFloat = 12) -> some View {
        modifier(CardLiftAnimation(isHovering: isHovering, elevation: elevation))
    }
    
    public func cardExpand(isExpanded: Bool, scale: CGFloat = 1.05) -> some View {
        modifier(CardExpandAnimation(isExpanded: isExpanded, scale: scale))
    }
    
    public func cardCollapse(isCollapsed: Bool) -> some View {
        modifier(CardCollapseAnimation(isCollapsed: isCollapsed))
    }
    
    public func heroExpand(isExpanded: Bool, scale: CGFloat = 1.1) -> some View {
        modifier(HeroExpandAnimation(isExpanded: isExpanded, scale: scale))
    }
    
    public func heroCollapse(isCollapsed: Bool) -> some View {
        modifier(HeroCollapseAnimation(isCollapsed: isCollapsed))
    }
    
    public func floating(offset: CGFloat = 8, duration: Double = 2.0) -> some View {
        modifier(FloatingAnimation(offset: offset, duration: duration))
    }
    
    public func breathing(minScale: CGFloat = 0.95, maxScale: CGFloat = 1.05, duration: Double = 3.0) -> some View {
        modifier(BreathingAnimation(minScale: minScale, maxScale: maxScale, duration: duration))
    }
    
    public func pulse(intensity: Double = 0.3, duration: Double = 1.5) -> some View {
        modifier(PulseAnimation(intensity: intensity, duration: duration))
    }
    
    public func bounce(height: CGFloat = 10, duration: Double = 0.6) -> some View {
        modifier(BounceAnimation(height: height, duration: duration))
    }
    
    public func fade(isVisible: Bool, duration: Double = 0.3) -> some View {
        modifier(FadeAnimation(isVisible: isVisible, duration: duration))
    }
    
    public func scaleMotion(scale: CGFloat = 1.0, duration: Double = 0.3) -> some View {
        modifier(ScaleAnimation(scale: scale, duration: duration))
    }
    
    public func blurMotion(blurAmount: CGFloat = 0, duration: Double = 0.3) -> some View {
        modifier(BlurAnimation(blurAmount: blurAmount, duration: duration))
    }
    
    public func depthShift(depthOffset: CGFloat = 0, rotationX: Double = 0) -> some View {
        modifier(DepthShiftAnimation(depthOffset: depthOffset, rotationX: rotationX))
    }
}
