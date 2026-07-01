import SwiftUI

// MARK: - Loading State Animation

public struct LoadingStateAnimation: ViewModifier {
    @State private var isAnimating = false
    let duration: Double
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(duration: Double = 2.0) {
        self.duration = duration
    }
    
    public func body(content: Content) -> some View {
        content
            .rotation3DEffect(
                .degrees(isAnimating ? 360 : 0),
                axis: (x: 0, y: 0, z: 1)
            )
            .animation(
                reduceMotion ? 
                .linear(duration: 0.01) :
                .linear(duration: duration).repeatForever(autoreverses: false),
                value: isAnimating
            )
            .onAppear {
                if !reduceMotion {
                    isAnimating = true
                }
            }
    }
}

// MARK: - Empty State Animation

public struct EmptyStateAnimation: ViewModifier {
    @State private var isAnimating = false
    let scale: CGFloat
    let duration: Double
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(scale: CGFloat = 0.95, duration: Double = 1.5) {
        self.scale = scale
        self.duration = duration
    }
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(isAnimating ? 1.0 : scale)
            .opacity(isAnimating ? 1.0 : 0.6)
            .animation(
                reduceMotion ? 
                .linear(duration: 0.01) :
                .easeInOut(duration: duration).repeatForever(autoreverses: true),
                value: isAnimating
            )
            .onAppear {
                if !reduceMotion {
                    isAnimating = true
                }
            }
    }
}

// MARK: - Success State Animation

public struct SuccessStateAnimation: ViewModifier {
    let isSuccessful: Bool
    let scale: CGFloat
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(isSuccessful: Bool, scale: CGFloat = 1.1) {
        self.isSuccessful = isSuccessful
        self.scale = scale
    }
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(isSuccessful ? scale : 1.0)
            .opacity(isSuccessful ? 1.0 : 0.0)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.4, dampingFraction: 0.7),
                value: isSuccessful
            )
    }
}

// MARK: - Error State Animation

public struct ErrorStateAnimation: ViewModifier {
    let isError: Bool
    let shakeIntensity: CGFloat
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    @State private var shakeOffset: CGFloat = 0
    
    public init(isError: Bool, shakeIntensity: CGFloat = 10) {
        self.isError = isError
        self.shakeIntensity = shakeIntensity
    }
    
    public func body(content: Content) -> some View {
        content
            .offset(x: shakeOffset)
            .opacity(isError ? 1.0 : 0.0)
            .onAppear {
                if isError && !reduceMotion {
                    performShake()
                }
            }
    }
    
    private func performShake() {
        for i in 0..<4 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.1) {
                withAnimation(.easeInOut(duration: 0.1)) {
                    shakeOffset = (i % 2 == 0) ? shakeIntensity : -shakeIntensity
                }
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.easeInOut(duration: 0.1)) {
                shakeOffset = 0
            }
        }
    }
}

// MARK: - Refresh State Animation

public struct RefreshStateAnimation: ViewModifier {
    let isRefreshing: Bool
    let duration: Double
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    @State private var rotation: Double = 0
    
    public init(isRefreshing: Bool, duration: Double = 1.5) {
        self.isRefreshing = isRefreshing
        self.duration = duration
    }
    
    public func body(content: Content) -> some View {
        content
            .rotation3DEffect(
                .degrees(rotation),
                axis: (x: 0, y: 0, z: 1)
            )
            .onAppear {
                if isRefreshing && !reduceMotion {
                    withAnimation(.linear(duration: duration).repeatForever(autoreverses: false)) {
                        rotation = 360
                    }
                }
            }
            .onChange(of: isRefreshing) { old, new in
                if new && !reduceMotion {
                    withAnimation(.linear(duration: duration).repeatForever(autoreverses: false)) {
                        rotation = 360
                    }
                } else {
                    rotation = 0
                }
            }
    }
}

// MARK: - Content Swap Animation

public struct ContentSwapAnimation: ViewModifier {
    let swapTrigger: Bool
    let direction: SwapDirection
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public enum SwapDirection {
        case up
        case down
        case left
        case right
    }
    
    public init(swapTrigger: Bool, direction: SwapDirection = .up) {
        self.swapTrigger = swapTrigger
        self.direction = direction
    }
    
    private var swapOffset: CGSize {
        let offset: CGFloat = UIScreen.main.bounds.height * 0.1
        switch direction {
        case .up:
            return CGSize(width: 0, height: swapTrigger ? 0 : offset)
        case .down:
            return CGSize(width: 0, height: swapTrigger ? 0 : -offset)
        case .left:
            return CGSize(width: swapTrigger ? 0 : offset, height: 0)
        case .right:
            return CGSize(width: swapTrigger ? 0 : -offset, height: 0)
        }
    }
    
    public func body(content: Content) -> some View {
        content
            .offset(swapOffset)
            .opacity(swapTrigger ? 1.0 : 0.0)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.4, dampingFraction: 0.8),
                value: swapTrigger
            )
    }
}

// MARK: - View Extensions

extension View {
    public func loadingState(duration: Double = 2.0) -> some View {
        modifier(LoadingStateAnimation(duration: duration))
    }
    
    public func emptyState(scale: CGFloat = 0.95, duration: Double = 1.5) -> some View {
        modifier(EmptyStateAnimation(scale: scale, duration: duration))
    }
    
    public func successState(isSuccessful: Bool, scale: CGFloat = 1.1) -> some View {
        modifier(SuccessStateAnimation(isSuccessful: isSuccessful, scale: scale))
    }
    
    public func errorState(isError: Bool, shakeIntensity: CGFloat = 10) -> some View {
        modifier(ErrorStateAnimation(isError: isError, shakeIntensity: shakeIntensity))
    }
    
    public func refreshState(isRefreshing: Bool, duration: Double = 1.5) -> some View {
        modifier(RefreshStateAnimation(isRefreshing: isRefreshing, duration: duration))
    }
    
    public func contentSwap(swapTrigger: Bool, direction: ContentSwapAnimation.SwapDirection = .up) -> some View {
        modifier(ContentSwapAnimation(swapTrigger: swapTrigger, direction: direction))
    }
}
