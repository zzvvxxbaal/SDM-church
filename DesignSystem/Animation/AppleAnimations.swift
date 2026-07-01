import SwiftUI

struct AppleSpringAnimations {
    static let bouncy = Animation.spring(response: 0.6, dampingFraction: 0.7)
    static let smooth = Animation.spring(response: 0.4, dampingFraction: 0.8)
    static let snappy = Animation.spring(response: 0.3, dampingFraction: 0.75)
    static let gentle = Animation.easeInOut(duration: 0.3)
    static let easeOut = Animation.easeOut(duration: 0.4)
}

struct AppleContentTransition {
    static let fadeScale = AnyTransition.asymmetric(
        insertion: .scale(scale: 0.95).combined(with: .opacity),
        removal: .scale(scale: 0.95).combined(with: .opacity)
    )
    
    static let slideUp = AnyTransition.asymmetric(
        insertion: .move(edge: .bottom).combined(with: .opacity),
        removal: .move(edge: .bottom).combined(with: .opacity)
    )
    
    static let blur = AnyTransition.opacity
}

struct ContentDepthEffect: ViewModifier {
    let depth: CGFloat
    let isActive: Bool
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isActive ? (1 - depth * 0.05) : 1.0)
            .offset(y: isActive ? depth * 2 : 0)
            .opacity(isActive ? 0.95 : 1.0)
            .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isActive)
    }
}

extension View {
    func contentDepth(_ depth: CGFloat = 1, isActive: Bool = true) -> some View {
        modifier(ContentDepthEffect(depth: depth, isActive: isActive))
    }
}

// Parallax scroll effect
struct ParallaxModifier: ViewModifier {
    let offset: CGFloat
    let multiplier: CGFloat
    
    func body(content: Content) -> some View {
        content
            .offset(y: offset * multiplier)
    }
}

extension View {
    func parallax(offset: CGFloat, multiplier: CGFloat = 0.5) -> some View {
        modifier(ParallaxModifier(offset: offset, multiplier: multiplier))
    }
}

// Stretchable header effect
struct StretchableHeaderModifier: ViewModifier {
    let minHeight: CGFloat
    let maxHeight: CGFloat
    let scrollOffset: CGFloat
    
    var adjustedHeight: CGFloat {
        let stretch = max(0, -scrollOffset)
        return maxHeight + stretch
    }
    
    func body(content: Content) -> some View {
        content
            .frame(height: adjustedHeight)
            .clipped()
            .offset(y: min(0, scrollOffset))
    }
}

extension View {
    func stretchableHeader(
        minHeight: CGFloat = 200,
        maxHeight: CGFloat = 300,
        scrollOffset: CGFloat
    ) -> some View {
        modifier(StretchableHeaderModifier(minHeight: minHeight, maxHeight: maxHeight, scrollOffset: scrollOffset))
    }
}

// Floating content animation
struct FloatingContentModifier: ViewModifier {
    @State private var offset: CGFloat = 0
    let duration: Double
    
    func body(content: Content) -> some View {
        content
            .offset(y: offset)
            .onAppear {
                withAnimation(
                    Animation.easeInOut(duration: duration)
                        .repeatForever(autoreverses: true)
                ) {
                    offset = 8
                }
            }
    }
}

extension View {
    func floatingContent(duration: Double = 2.0) -> some View {
        modifier(FloatingContentModifier(duration: duration))
    }
}

// Scale on scroll animation
struct ScrollScaleModifier: ViewModifier {
    let scrollOffset: CGFloat
    let threshold: CGFloat
    
    var scale: CGFloat {
        let progress = min(1, abs(scrollOffset) / threshold)
        return 1 - (progress * 0.1)
    }
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(scale, anchor: .center)
            .animation(.spring(response: 0.4, dampingFraction: 0.8), value: scale)
    }
}

extension View {
    func scrollScale(offset: CGFloat, threshold: CGFloat = 100) -> some View {
        modifier(ScrollScaleModifier(scrollOffset: offset, threshold: threshold))
    }
}

// Blur on scroll
struct ScrollBlurModifier: ViewModifier {
    let scrollOffset: CGFloat
    let threshold: CGFloat
    
    var blurAmount: CGFloat {
        let progress = min(1, abs(scrollOffset) / threshold)
        return progress * 5
    }
    
    func body(content: Content) -> some View {
        content
            .blur(radius: blurAmount)
            .animation(.easeOut(duration: 0.3), value: blurAmount)
    }
}

extension View {
    func scrollBlur(offset: CGFloat, threshold: CGFloat = 200) -> some View {
        modifier(ScrollBlurModifier(scrollOffset: offset, threshold: threshold))
    }
}

// Subtitle fade effect
struct SubtitleFadeModifier: ViewModifier {
    let scrollOffset: CGFloat
    let threshold: CGFloat
    
    var opacity: Double {
        let progress = min(1, max(0, scrollOffset / threshold))
        return Double(1 - progress)
    }
    
    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .animation(.easeOut(duration: 0.3), value: opacity)
    }
}

extension View {
    func subtitleFade(offset: CGFloat, threshold: CGFloat = 50) -> some View {
        modifier(SubtitleFadeModifier(scrollOffset: offset, threshold: threshold))
    }
}
