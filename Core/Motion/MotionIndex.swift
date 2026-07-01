import SwiftUI

// MARK: - Motion System Index

/// Comprehensive motion and animation framework for Apple-style interactions.
///
/// The Motion system provides reusable animation infrastructure for:
/// - Animation presets and timing curves
/// - Interaction animations (button press, card, hero, floating, etc.)
/// - Scroll animations (parallax, stretch header, collapse, etc.)
/// - Navigation animations (push, pop, sheet, hero, etc.)
/// - Icon animations (bounce, pulse, appear, disappear, etc.)
/// - State transitions (loading, empty, success, error, refresh, etc.)
///
/// All animations respect Reduce Motion accessibility settings.
///
/// Example Usage:
/// ```swift
/// Text("Hello")
///     .buttonPress(isPressed: isPressed)
///     .animation(MotionTiming.snappy.animation, value: isActive)
/// ```

public enum MotionSystem {
    // MARK: - Timing
    
    /// Animation timing presets
    public static let timing = MotionTiming.self
    public static let spring = MotionSpring.self
    
    // MARK: - Interactions
    
    /// Button press interaction animation
    public static func buttonPressAnimation(
        isPressed: Bool,
        scale: CGFloat = 0.95,
        opacity: Double = 0.8,
        hapticFeedback: Bool = true
    ) -> some ViewModifier {
        ButtonPressAnimation(
            isPressed: isPressed,
            scale: scale,
            opacity: opacity,
            hapticFeedback: hapticFeedback
        )
    }
    
    /// Card press interaction animation
    public static func cardPressAnimation(
        isPressed: Bool,
        depth: CGFloat = 8,
        rotationX: Double = 1.5
    ) -> some ViewModifier {
        CardPressAnimation(isPressed: isPressed, depth: depth, rotationX: rotationX)
    }
    
    /// Card lift animation on hover
    public static func cardLiftAnimation(
        isHovering: Bool,
        elevation: CGFloat = 12
    ) -> some ViewModifier {
        CardLiftAnimation(isHovering: isHovering, elevation: elevation)
    }
    
    /// Card expand animation
    public static func cardExpandAnimation(
        isExpanded: Bool,
        scale: CGFloat = 1.05
    ) -> some ViewModifier {
        CardExpandAnimation(isExpanded: isExpanded, scale: scale)
    }
    
    /// Card collapse animation
    public static func cardCollapseAnimation(
        isCollapsed: Bool
    ) -> some ViewModifier {
        CardCollapseAnimation(isCollapsed: isCollapsed)
    }
    
    /// Hero element expand animation
    public static func heroExpandAnimation(
        isExpanded: Bool,
        scale: CGFloat = 1.1
    ) -> some ViewModifier {
        HeroExpandAnimation(isExpanded: isExpanded, scale: scale)
    }
    
    /// Hero element collapse animation
    public static func heroCollapseAnimation(
        isCollapsed: Bool
    ) -> some ViewModifier {
        HeroCollapseAnimation(isCollapsed: isCollapsed)
    }
    
    /// Floating animation for elements
    public static func floatingAnimation(
        offset: CGFloat = 8,
        duration: Double = 2.0
    ) -> some ViewModifier {
        FloatingAnimation(offset: offset, duration: duration)
    }
    
    /// Breathing animation (scale pulse)
    public static func breathingAnimation(
        minScale: CGFloat = 0.95,
        maxScale: CGFloat = 1.05,
        duration: Double = 3.0
    ) -> some ViewModifier {
        BreathingAnimation(minScale: minScale, maxScale: maxScale, duration: duration)
    }
    
    /// Pulse animation (opacity)
    public static func pulseAnimation(
        intensity: Double = 0.3,
        duration: Double = 1.5
    ) -> some ViewModifier {
        PulseAnimation(intensity: intensity, duration: duration)
    }
    
    /// Bounce animation (vertical)
    public static func bounceAnimation(
        height: CGFloat = 10,
        duration: Double = 0.6
    ) -> some ViewModifier {
        BounceAnimation(height: height, duration: duration)
    }
    
    /// Fade animation
    public static func fadeAnimation(
        isVisible: Bool,
        duration: Double = 0.3
    ) -> some ViewModifier {
        FadeAnimation(isVisible: isVisible, duration: duration)
    }
    
    /// Scale animation
    public static func scaleAnimation(
        scale: CGFloat = 1.0,
        duration: Double = 0.3
    ) -> some ViewModifier {
        ScaleAnimation(scale: scale, duration: duration)
    }
    
    /// Blur animation
    public static func blurAnimation(
        blurAmount: CGFloat = 0,
        duration: Double = 0.3
    ) -> some ViewModifier {
        BlurAnimation(blurAmount: blurAmount, duration: duration)
    }
    
    /// Depth shift animation (3D)
    public static func depthShiftAnimation(
        depthOffset: CGFloat = 0,
        rotationX: Double = 0
    ) -> some ViewModifier {
        DepthShiftAnimation(depthOffset: depthOffset, rotationX: rotationX)
    }
    
    // MARK: - Scroll
    
    /// Scroll transition animation
    public static func scrollTransitionAnimation(
        scrollOffset: CGFloat,
        threshold: CGFloat = 100
    ) -> some ViewModifier {
        ScrollTransitionAnimation(scrollOffset: scrollOffset, threshold: threshold)
    }
    
    /// Parallax animation for scroll
    public static func parallaxAnimation(
        scrollOffset: CGFloat,
        multiplier: CGFloat = 0.5
    ) -> some ViewModifier {
        ParallaxAnimation(scrollOffset: scrollOffset, multiplier: multiplier)
    }
    
    /// Stretchable header animation
    public static func stretchHeaderAnimation(
        scrollOffset: CGFloat,
        minHeight: CGFloat = 200,
        maxHeight: CGFloat = 320
    ) -> some ViewModifier {
        StretchHeaderAnimation(scrollOffset: scrollOffset, minHeight: minHeight, maxHeight: maxHeight)
    }
    
    /// Large title collapse animation
    public static func largeTitleCollapseAnimation(
        scrollOffset: CGFloat,
        threshold: CGFloat = 50
    ) -> some ViewModifier {
        LargeTitleCollapseAnimation(scrollOffset: scrollOffset, threshold: threshold)
    }
    
    /// Navigation blur animation on scroll
    public static func navigationBlurAnimation(
        scrollOffset: CGFloat,
        threshold: CGFloat = 200
    ) -> some ViewModifier {
        NavigationBlurAnimation(scrollOffset: scrollOffset, threshold: threshold)
    }
    
    /// Background depth animation on scroll
    public static func backgroundDepthAnimation(
        scrollOffset: CGFloat,
        threshold: CGFloat = 200
    ) -> some ViewModifier {
        BackgroundDepthAnimation(scrollOffset: scrollOffset, threshold: threshold)
    }
    
    /// Floating card motion animation on scroll
    public static func floatingCardMotionAnimation(
        scrollOffset: CGFloat,
        strength: CGFloat = 0.5
    ) -> some ViewModifier {
        FloatingCardMotionAnimation(scrollOffset: scrollOffset, strength: strength)
    }
    
    // MARK: - Navigation
    
    /// Push navigation transition
    public static func pushNavigationTransition(
        isActive: Bool
    ) -> some ViewModifier {
        PushNavigationTransition(isActive: isActive)
    }
    
    /// Pop navigation transition
    public static func popNavigationTransition(
        isActive: Bool
    ) -> some ViewModifier {
        PopNavigationTransition(isActive: isActive)
    }
    
    /// Sheet presentation transition
    public static func sheetPresentationTransition(
        isPresented: Bool
    ) -> some ViewModifier {
        SheetPresentationTransition(isPresented: isPresented)
    }
    
    /// Full screen presentation transition
    public static func fullScreenPresentationTransition(
        isPresented: Bool
    ) -> some ViewModifier {
        FullScreenPresentationTransition(isPresented: isPresented)
    }
    
    /// Bottom sheet presentation transition
    public static func bottomSheetPresentationTransition(
        isPresented: Bool
    ) -> some ViewModifier {
        BottomSheetPresentationTransition(isPresented: isPresented)
    }
    
    /// Hero transition animation
    public static func heroTransitionAnimation(
        isActive: Bool,
        scale: CGFloat = 1.1
    ) -> some ViewModifier {
        HeroTransitionAnimation(isActive: isActive, scale: scale)
    }
    
    // MARK: - Icons
    
    /// Symbol effect animation
    public static func symbolEffectAnimation(
        _ effect: SymbolEffectAnimation.SymbolEffect,
        isActive: Bool = true
    ) -> some ViewModifier {
        SymbolEffectAnimation(isActive: isActive, effect: effect)
    }
    
    /// Icon bounce animation
    public static func iconBounceAnimation(
        height: CGFloat = 6,
        duration: Double = 0.6
    ) -> some ViewModifier {
        IconBounceAnimation(height: height, duration: duration)
    }
    
    /// Icon pulse animation
    public static func iconPulseAnimation(
        scale: CGFloat = 1.2,
        duration: Double = 1.5
    ) -> some ViewModifier {
        IconPulseAnimation(scale: scale, duration: duration)
    }
    
    /// Icon variable color animation
    public static func iconVariableColorAnimation(
        isActive: Bool
    ) -> some ViewModifier {
        IconVariableColorAnimation(isActive: isActive)
    }
    
    /// Icon appear animation
    public static func iconAppearAnimation(
        isVisible: Bool
    ) -> some ViewModifier {
        IconAppearAnimation(isVisible: isVisible)
    }
    
    /// Icon disappear animation
    public static func iconDisappearAnimation(
        isHidden: Bool
    ) -> some ViewModifier {
        IconDisappearAnimation(isHidden: isHidden)
    }
    
    /// Icon replace animation
    public static func iconReplaceAnimation(
        shouldReplace: Bool
    ) -> some ViewModifier {
        IconReplaceAnimation(shouldReplace: shouldReplace)
    }
    
    // MARK: - State Transitions
    
    /// Loading state animation
    public static func loadingStateAnimation(
        duration: Double = 2.0
    ) -> some ViewModifier {
        LoadingStateAnimation(duration: duration)
    }
    
    /// Empty state animation
    public static func emptyStateAnimation(
        scale: CGFloat = 0.95,
        duration: Double = 1.5
    ) -> some ViewModifier {
        EmptyStateAnimation(scale: scale, duration: duration)
    }
    
    /// Success state animation
    public static func successStateAnimation(
        isSuccessful: Bool,
        scale: CGFloat = 1.1
    ) -> some ViewModifier {
        SuccessStateAnimation(isSuccessful: isSuccessful, scale: scale)
    }
    
    /// Error state animation with shake
    public static func errorStateAnimation(
        isError: Bool,
        shakeIntensity: CGFloat = 10
    ) -> some ViewModifier {
        ErrorStateAnimation(isError: isError, shakeIntensity: shakeIntensity)
    }
    
    /// Refresh state animation
    public static func refreshStateAnimation(
        isRefreshing: Bool,
        duration: Double = 1.5
    ) -> some ViewModifier {
        RefreshStateAnimation(isRefreshing: isRefreshing, duration: duration)
    }
    
    /// Content swap animation
    public static func contentSwapAnimation(
        swapTrigger: Bool,
        direction: ContentSwapAnimation.SwapDirection = .up
    ) -> some ViewModifier {
        ContentSwapAnimation(swapTrigger: swapTrigger, direction: direction)
    }
}

// MARK: - Convenience Extensions

extension View {
    /// Apply motion system animation with fluent interface
    public func withMotion(
        timing: MotionTiming
    ) -> some View {
        self.animation(timing.animation, value: UUID())
    }
}
