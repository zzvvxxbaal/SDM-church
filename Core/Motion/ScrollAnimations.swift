import SwiftUI

// MARK: - ScrollTransition Animation

public struct ScrollTransitionAnimation: ViewModifier {
    let scrollOffset: CGFloat
    let threshold: CGFloat
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    var progress: CGFloat {
        min(1, max(0, scrollOffset / threshold))
    }
    
    public init(scrollOffset: CGFloat, threshold: CGFloat = 100) {
        self.scrollOffset = scrollOffset
        self.threshold = threshold
    }
    
    public func body(content: Content) -> some View {
        content
            .opacity(1.0 - (progress * 0.3))
            .scaleEffect(1.0 - (progress * 0.05), anchor: .center)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .easeOut(duration: 0.3),
                value: progress
            )
    }
}

// MARK: - Parallax Animation

public struct ParallaxAnimation: ViewModifier {
    let scrollOffset: CGFloat
    let multiplier: CGFloat
    
    public init(scrollOffset: CGFloat, multiplier: CGFloat = 0.5) {
        self.scrollOffset = scrollOffset
        self.multiplier = multiplier
    }
    
    public func body(content: Content) -> some View {
        content
            .offset(y: scrollOffset * multiplier)
    }
}

// MARK: - Stretch Header Animation

public struct StretchHeaderAnimation: ViewModifier {
    let scrollOffset: CGFloat
    let minHeight: CGFloat
    let maxHeight: CGFloat
    
    var currentHeight: CGFloat {
        let stretch = max(0, -scrollOffset)
        return maxHeight + stretch
    }
    
    public init(scrollOffset: CGFloat, minHeight: CGFloat = 200, maxHeight: CGFloat = 320) {
        self.scrollOffset = scrollOffset
        self.minHeight = minHeight
        self.maxHeight = maxHeight
    }
    
    public func body(content: Content) -> some View {
        content
            .frame(height: currentHeight)
            .clipped()
            .offset(y: min(0, scrollOffset))
    }
}

// MARK: - Large Title Collapse Animation

public struct LargeTitleCollapseAnimation: ViewModifier {
    let scrollOffset: CGFloat
    let threshold: CGFloat
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    var progress: CGFloat {
        min(1, max(0, scrollOffset / threshold))
    }
    
    var scale: CGFloat {
        1.0 - (progress * 0.4)
    }
    
    var opacity: Double {
        Double(1.0 - (progress * 0.5))
    }
    
    var offset: CGFloat {
        -progress * 20
    }
    
    public init(scrollOffset: CGFloat, threshold: CGFloat = 50) {
        self.scrollOffset = scrollOffset
        self.threshold = threshold
    }
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(scale, anchor: .topLeading)
            .opacity(opacity)
            .offset(y: offset)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.3, dampingFraction: 0.8),
                value: scale
            )
    }
}

// MARK: - Navigation Blur Animation

public struct NavigationBlurAnimation: ViewModifier {
    let scrollOffset: CGFloat
    let threshold: CGFloat
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    var progress: CGFloat {
        min(1, abs(scrollOffset) / threshold)
    }
    
    var blurAmount: CGFloat {
        progress * 5
    }
    
    public init(scrollOffset: CGFloat, threshold: CGFloat = 200) {
        self.scrollOffset = scrollOffset
        self.threshold = threshold
    }
    
    public func body(content: Content) -> some View {
        content
            .blur(radius: blurAmount)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .easeOut(duration: 0.3),
                value: blurAmount
            )
    }
}

// MARK: - Background Depth Animation

public struct BackgroundDepthAnimation: ViewModifier {
    let scrollOffset: CGFloat
    let threshold: CGFloat
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    var progress: CGFloat {
        min(1, abs(scrollOffset) / threshold)
    }
    
    var scale: CGFloat {
        1.0 - (progress * 0.1)
    }
    
    var opacity: Double {
        Double(1.0 - (progress * 0.3))
    }
    
    public init(scrollOffset: CGFloat, threshold: CGFloat = 200) {
        self.scrollOffset = scrollOffset
        self.threshold = threshold
    }
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(scale, anchor: .center)
            .opacity(opacity)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.4, dampingFraction: 0.8),
                value: scale
            )
    }
}

// MARK: - Floating Card Motion Animation

public struct FloatingCardMotionAnimation: ViewModifier {
    let scrollOffset: CGFloat
    let strength: CGFloat
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    var offset: CGFloat {
        scrollOffset * strength * 0.5
    }
    
    var rotation: Double {
        Double(min(5, abs(scrollOffset) * 0.01))
    }
    
    public init(scrollOffset: CGFloat, strength: CGFloat = 0.5) {
        self.scrollOffset = scrollOffset
        self.strength = strength
    }
    
    public func body(content: Content) -> some View {
        content
            .offset(y: offset)
            .rotation3DEffect(
                .degrees(rotation),
                axis: (x: 1, y: 1, z: 0)
            )
    }
}

// MARK: - View Extensions

extension View {
    public func scrollTransition(scrollOffset: CGFloat, threshold: CGFloat = 100) -> some View {
        modifier(ScrollTransitionAnimation(scrollOffset: scrollOffset, threshold: threshold))
    }
    
    public func parallax(scrollOffset: CGFloat, multiplier: CGFloat = 0.5) -> some View {
        modifier(ParallaxAnimation(scrollOffset: scrollOffset, multiplier: multiplier))
    }
    
    public func stretchHeader(scrollOffset: CGFloat, minHeight: CGFloat = 200, maxHeight: CGFloat = 320) -> some View {
        modifier(StretchHeaderAnimation(scrollOffset: scrollOffset, minHeight: minHeight, maxHeight: maxHeight))
    }
    
    public func largeTitleCollapse(scrollOffset: CGFloat, threshold: CGFloat = 50) -> some View {
        modifier(LargeTitleCollapseAnimation(scrollOffset: scrollOffset, threshold: threshold))
    }
    
    public func navigationBlur(scrollOffset: CGFloat, threshold: CGFloat = 200) -> some View {
        modifier(NavigationBlurAnimation(scrollOffset: scrollOffset, threshold: threshold))
    }
    
    public func backgroundDepth(scrollOffset: CGFloat, threshold: CGFloat = 200) -> some View {
        modifier(BackgroundDepthAnimation(scrollOffset: scrollOffset, threshold: threshold))
    }
    
    public func floatingCardMotion(scrollOffset: CGFloat, strength: CGFloat = 0.5) -> some View {
        modifier(FloatingCardMotionAnimation(scrollOffset: scrollOffset, strength: strength))
    }
}
