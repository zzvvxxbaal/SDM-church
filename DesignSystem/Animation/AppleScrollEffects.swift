import SwiftUI

struct ParallaxScrollView<Content: View>: View {
    @ViewBuilder
    let content: Content
    
    let parallaxStrength: CGFloat
    
    @State private var scrollOffset: CGFloat = 0
    
    init(
        parallaxStrength: CGFloat = 0.5,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.parallaxStrength = parallaxStrength
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: AppSpacing.none) {
                content
            }
        }
        .onScrollGeometryChange(
            for: CGFloat.self,
            of: { geometry in
                geometry.contentOffset.y
            },
            initial: 0
        ) { _, newValue in
            scrollOffset = newValue
        }
    }
}

struct StretchableHero<Content: View>: View {
    @ViewBuilder
    let content: Content
    
    let minHeight: CGFloat
    let maxHeight: CGFloat
    
    @State private var scrollOffset: CGFloat = 0
    
    init(
        minHeight: CGFloat = 200,
        maxHeight: CGFloat = 320,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.minHeight = minHeight
        self.maxHeight = maxHeight
    }
    
    var currentHeight: CGFloat {
        let stretch = max(0, -scrollOffset)
        return maxHeight + stretch
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .frame(height: currentHeight)
                .clipped()
                .offset(y: min(0, scrollOffset))
        }
        .frame(height: currentHeight)
        .onScrollGeometryChange(
            for: CGFloat.self,
            of: { geometry in
                geometry.contentOffset.y
            },
            initial: 0
        ) { _, newValue in
            scrollOffset = newValue
        }
    }
}

struct LargeTitleCollapse: ViewModifier {
    let scrollOffset: CGFloat
    let threshold: CGFloat
    
    var scale: CGFloat {
        let progress = min(1, max(0, scrollOffset / threshold))
        return 1 - (progress * 0.4)
    }
    
    var opacity: Double {
        let progress = min(1, max(0, scrollOffset / threshold))
        return Double(1 - progress * 0.5)
    }
    
    var offset: CGFloat {
        let progress = min(1, max(0, scrollOffset / threshold))
        return -progress * 20
    }
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(scale, anchor: .topLeading)
            .opacity(opacity)
            .offset(y: offset)
            .animation(.spring(response: 0.3, dampingFraction: 0.8), value: scale)
    }
}

extension View {
    func largeTitleCollapse(scrollOffset: CGFloat, threshold: CGFloat = 50) -> some View {
        modifier(LargeTitleCollapse(scrollOffset: scrollOffset, threshold: threshold))
    }
}

// Floating action button animation
struct FloatingButtonModifier: ViewModifier {
    @State private var isFloating = false
    
    func body(content: Content) -> some View {
        content
            .offset(y: isFloating ? -8 : 0)
            .shadow(color: AppColors.glassShadow.opacity(0.6), radius: isFloating ? 12 : 4, x: 0, y: isFloating ? 8 : 2)
            .onAppear {
                guard !isFloating else { return }

                withAnimation(
                    Animation.easeInOut(duration: 2)
                        .repeatForever(autoreverses: true)
                ) {
                    isFloating = true
                }
            }
            .onDisappear {
                isFloating = false
            }
    }
}

extension View {
    func floatingEffect() -> some View {
        modifier(FloatingButtonModifier())
    }
}

// Smooth scroll transition
struct SmoothScrollTransition: ViewModifier {
    let scrollOffset: CGFloat
    let triggerOffset: CGFloat
    
    var isVisible: Bool {
        scrollOffset > triggerOffset
    }
    
    func body(content: Content) -> some View {
        content
            .opacity(isVisible ? 1.0 : 0.0)
            .scaleEffect(isVisible ? 1.0 : 0.8, anchor: .center)
            .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isVisible)
    }
}

extension View {
    func smoothScrollTransition(scrollOffset: CGFloat, triggerOffset: CGFloat = 0) -> some View {
        modifier(SmoothScrollTransition(scrollOffset: scrollOffset, triggerOffset: triggerOffset))
    }
}
