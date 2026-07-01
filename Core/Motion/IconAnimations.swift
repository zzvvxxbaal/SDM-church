import SwiftUI

// MARK: - Symbol Effect Animation

public struct SymbolEffectAnimation: ViewModifier {
    let isActive: Bool
    let effect: SymbolEffect
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public enum SymbolEffect {
        case bounce
        case pulse
        case variableColor
        case appear
        case disappear
        case scale
        case wiggle
        case replace
    }
    
    public init(isActive: Bool, effect: SymbolEffect) {
        self.isActive = isActive
        self.effect = effect
    }
    
    public func body(content: Content) -> some View {
        if reduceMotion {
            content
        } else {
            switch effect {
            case .bounce:
                content
                    .symbolEffect(.bounce, options: .speed(2), isActive: isActive)
            case .pulse:
                content
                    .symbolEffect(.pulse, options: .speed(1.5), isActive: isActive)
            case .variableColor:
                content
                    .symbolEffect(.variableColor, options: .speed(1), isActive: isActive)
            case .appear:
                content
                    .symbolEffect(.appear, options: .speed(1), isActive: isActive)
            case .disappear:
                content
                    .symbolEffect(.disappear, options: .speed(1), isActive: isActive)
            case .scale:
                content
                    .symbolEffect(.scale, options: .speed(1), isActive: isActive)
            case .wiggle:
                content
                    .symbolEffect(.wiggle, options: .speed(2), isActive: isActive)
            case .replace:
                content
                    .symbolEffect(.replace, options: .speed(1), isActive: isActive)
            }
        }
    }
}

// MARK: - Icon Bounce Animation

public struct IconBounceAnimation: ViewModifier {
    @State private var isBouncing = false
    let height: CGFloat
    let duration: Double
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(height: CGFloat = 6, duration: Double = 0.6) {
        self.height = height
        self.duration = duration
    }
    
    public func body(content: Content) -> some View {
        content
            .offset(y: isBouncing ? height : 0)
            .animation(
                reduceMotion ? 
                .linear(duration: 0.01) :
                .easeInOut(duration: duration).repeatForever(autoreverses: true),
                value: isBouncing
            )
            .onAppear {
                if !reduceMotion {
                    isBouncing = true
                }
            }
    }
}

// MARK: - Icon Pulse Animation

public struct IconPulseAnimation: ViewModifier {
    @State private var isPulsing = false
    let scale: CGFloat
    let duration: Double
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(scale: CGFloat = 1.2, duration: Double = 1.5) {
        self.scale = scale
        self.duration = duration
    }
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(isPulsing ? scale : 1.0)
            .opacity(isPulsing ? 0.5 : 1.0)
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

// MARK: - Icon Variable Color Animation

public struct IconVariableColorAnimation: ViewModifier {
    let isActive: Bool
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(isActive: Bool) {
        self.isActive = isActive
    }
    
    public func body(content: Content) -> some View {
        content
            .opacity(isActive ? 1.0 : 0.6)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .easeInOut(duration: 0.3),
                value: isActive
            )
    }
}

// MARK: - Icon Appear Animation

public struct IconAppearAnimation: ViewModifier {
    let isVisible: Bool
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(isVisible: Bool) {
        self.isVisible = isVisible
    }
    
    public func body(content: Content) -> some View {
        content
            .opacity(isVisible ? 1.0 : 0.0)
            .scaleEffect(isVisible ? 1.0 : 0.5)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.3, dampingFraction: 0.75),
                value: isVisible
            )
    }
}

// MARK: - Icon Disappear Animation

public struct IconDisappearAnimation: ViewModifier {
    let isHidden: Bool
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(isHidden: Bool) {
        self.isHidden = isHidden
    }
    
    public func body(content: Content) -> some View {
        content
            .opacity(isHidden ? 0.0 : 1.0)
            .scaleEffect(isHidden ? 0.5 : 1.0)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.3, dampingFraction: 0.75),
                value: isHidden
            )
    }
}

// MARK: - Icon Replace Animation

public struct IconReplaceAnimation: ViewModifier {
    let shouldReplace: Bool
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(shouldReplace: Bool) {
        self.shouldReplace = shouldReplace
    }
    
    public func body(content: Content) -> some View {
        content
            .opacity(shouldReplace ? 1.0 : 0.0)
            .rotation3DEffect(
                .degrees(shouldReplace ? 0 : -90),
                axis: (x: 0, y: 1, z: 0)
            )
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.3, dampingFraction: 0.75),
                value: shouldReplace
            )
    }
}

// MARK: - View Extensions

extension View {
    public func symbolEffect(
        _ effect: SymbolEffectAnimation.SymbolEffect,
        isActive: Bool = true
    ) -> some View {
        modifier(SymbolEffectAnimation(isActive: isActive, effect: effect))
    }
    
    public func iconBounce(height: CGFloat = 6, duration: Double = 0.6) -> some View {
        modifier(IconBounceAnimation(height: height, duration: duration))
    }
    
    public func iconPulse(scale: CGFloat = 1.2, duration: Double = 1.5) -> some View {
        modifier(IconPulseAnimation(scale: scale, duration: duration))
    }
    
    public func iconVariableColor(isActive: Bool) -> some View {
        modifier(IconVariableColorAnimation(isActive: isActive))
    }
    
    public func iconAppear(isVisible: Bool) -> some View {
        modifier(IconAppearAnimation(isVisible: isVisible))
    }
    
    public func iconDisappear(isHidden: Bool) -> some View {
        modifier(IconDisappearAnimation(isHidden: isHidden))
    }
    
    public func iconReplace(shouldReplace: Bool) -> some View {
        modifier(IconReplaceAnimation(shouldReplace: shouldReplace))
    }
}
