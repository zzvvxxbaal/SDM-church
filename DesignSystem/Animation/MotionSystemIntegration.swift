import SwiftUI

// MARK: - Design System Motion Integration

/// Design System animation extensions that provide Apple-style motion to all components
public extension View {
    // MARK: - Presets
    
    /// Apply motion timing preset animation
    @ViewBuilder
    func motion(timing: MotionTiming) -> some View {
        self.animation(timing.animation, value: UUID())
    }
    
    /// Apply spring preset animation
    @ViewBuilder
    func motion(spring: MotionSpring) -> some View {
        self.animation(spring.animation, value: UUID())
    }
    
    // MARK: - Interaction Animations
    
    /// Button press animation with haptic feedback
    @ViewBuilder
    func buttonMotion(isPressed: Bool) -> some View {
        self.buttonPress(isPressed: isPressed, hapticFeedback: true)
    }
    
    /// Card interaction animations
    @ViewBuilder
    func cardMotion(
        isPressed: Bool = false,
        isHovering: Bool = false,
        isExpanded: Bool = false
    ) -> some View {
        if isPressed {
            self.cardPress(isPressed: isPressed)
        } else if isHovering {
            self.cardLift(isHovering: isHovering)
        } else if isExpanded {
            self.cardExpand(isExpanded: isExpanded)
        } else {
            self
        }
    }
    
    /// Floating element animation (for FAB, notification badges, etc.)
    @ViewBuilder
    func floatMotion(offset: CGFloat = 8) -> some View {
        self.floating(offset: offset, duration: 2.5)
    }
    
    /// Breathing animation for attention-grabbing elements
    @ViewBuilder
    func breatheMotion(minScale: CGFloat = 0.95, maxScale: CGFloat = 1.05) -> some View {
        self.breathing(minScale: minScale, maxScale: maxScale, duration: 3.0)
    }
    
    /// Pulse animation for emphasis
    @ViewBuilder
    func pulseMotion(intensity: Double = 0.3) -> some View {
        self.pulse(intensity: intensity, duration: 1.5)
    }
    
    /// Bounce animation for focus
    @ViewBuilder
    func bounceMotion(height: CGFloat = 10) -> some View {
        self.bounce(height: height, duration: 0.6)
    }
    
    // MARK: - Scroll Animations
    
    /// Parallax scroll effect
    @ViewBuilder
    func parallaxMotion(scrollOffset: CGFloat) -> some View {
        self.parallax(scrollOffset: scrollOffset, multiplier: 0.5)
    }
    
    /// Large title collapse animation
    @ViewBuilder
    func collapseTitleMotion(scrollOffset: CGFloat) -> some View {
        self.largeTitleCollapse(scrollOffset: scrollOffset, threshold: 50)
    }
    
    /// Navigation bar blur on scroll
    @ViewBuilder
    func navBlurMotion(scrollOffset: CGFloat) -> some View {
        self.navigationBlur(scrollOffset: scrollOffset, threshold: 200)
    }
    
    /// Background depth shift on scroll
    @ViewBuilder
    func depthMotion(scrollOffset: CGFloat) -> some View {
        self.backgroundDepth(scrollOffset: scrollOffset, threshold: 200)
    }
    
    // MARK: - State Animations
    
    /// Loading state animation
    @ViewBuilder
    func loadingMotion() -> some View {
        self.loadingState(duration: 2.0)
    }
    
    /// Empty state animation
    @ViewBuilder
    func emptyMotion() -> some View {
        self.emptyState(scale: 0.95, duration: 1.5)
    }
    
    /// Success state animation
    @ViewBuilder
    func successMotion(isSuccessful: Bool) -> some View {
        self.successState(isSuccessful: isSuccessful, scale: 1.1)
    }
    
    /// Error state animation with shake
    @ViewBuilder
    func errorMotion(isError: Bool) -> some View {
        self.errorState(isError: isError, shakeIntensity: 10)
    }
    
    /// Refresh state animation
    @ViewBuilder
    func refreshMotion(isRefreshing: Bool) -> some View {
        self.refreshState(isRefreshing: isRefreshing, duration: 1.5)
    }
}

// MARK: - Component Motion Presets

public struct ComponentMotionPresets {
    
    // MARK: - Buttons
    
    /// Standard button motion (press + haptic)
    public static func buttonPreset(isPressed: Bool) -> some ViewModifier {
        ButtonPressAnimation(
            isPressed: isPressed,
            scale: 0.95,
            opacity: 0.85,
            hapticFeedback: true
        )
    }
    
    /// Icon button motion (smaller scale)
    public static func iconButtonPreset(isPressed: Bool) -> some ViewModifier {
        ButtonPressAnimation(
            isPressed: isPressed,
            scale: 0.9,
            opacity: 0.8,
            hapticFeedback: true
        )
    }
    
    /// Floating action button motion (floating + press)
    public static func fabPreset(isPressed: Bool) -> some ViewModifier {
        ButtonPressAnimation(
            isPressed: isPressed,
            scale: 0.92,
            opacity: 0.85,
            hapticFeedback: true
        )
    }
    
    // MARK: - Cards
    
    /// Standard card lift motion
    public static func cardLiftPreset(isHovering: Bool) -> some ViewModifier {
        CardLiftAnimation(
            isHovering: isHovering,
            elevation: 12
        )
    }
    
    /// Card expand motion
    public static func cardExpandPreset(isExpanded: Bool) -> some ViewModifier {
        CardExpandAnimation(
            isExpanded: isExpanded,
            scale: 1.05
        )
    }
    
    /// Hero card motion
    public static func heroCardPreset(isExpanded: Bool) -> some ViewModifier {
        HeroExpandAnimation(
            isExpanded: isExpanded,
            scale: 1.1
        )
    }
    
    // MARK: - Scroll
    
    /// Standard parallax effect for backgrounds
    public static func parallaxBackgroundPreset(scrollOffset: CGFloat) -> some ViewModifier {
        ParallaxAnimation(
            scrollOffset: scrollOffset,
            multiplier: 0.3
        )
    }
    
    /// Large parallax effect for hero images
    public static func parallaxHeroPreset(scrollOffset: CGFloat) -> some ViewModifier {
        ParallaxAnimation(
            scrollOffset: scrollOffset,
            multiplier: 0.6
        )
    }
    
    // MARK: - States
    
    /// Loading spinner animation
    public static func loadingSpinnerPreset() -> some ViewModifier {
        LoadingStateAnimation(duration: 2.0)
    }
    
    /// Empty state placeholder animation
    public static func emptyPlaceholderPreset() -> some ViewModifier {
        EmptyStateAnimation(scale: 0.95, duration: 1.5)
    }
    
    /// Refresh indicator animation
    public static func refreshIndicatorPreset(isRefreshing: Bool) -> some ViewModifier {
        RefreshStateAnimation(
            isRefreshing: isRefreshing,
            duration: 1.5
        )
    }
}

// MARK: - Motion Accessibility Helper

public struct MotionAccessibilityHelper {
    @Environment(\.accessibilityReduceMotion) static var reduceMotion
    
    /// Get animation based on accessibility settings
    public static func animation(
        _ timing: MotionTiming
    ) -> Animation {
        reduceMotion ? .linear(duration: 0.01) : timing.animation
    }
}
