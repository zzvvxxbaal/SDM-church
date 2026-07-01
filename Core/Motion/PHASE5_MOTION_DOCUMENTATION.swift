import Foundation

/// # Phase 5: Apple Motion System
///
/// A comprehensive, production-ready motion framework built with Apple's design principles.
/// Every interaction feels native, physical, and responsive.
///
/// ## Architecture
///
/// The Motion system is organized into 7 core modules:
///
/// ### 1. Animation Presets (`AnimationPresets.swift`)
/// Reusable timing curves and spring configurations:
/// - **Instant** (0.1s) - Quick, no-frills transitions
/// - **Smooth** (0.4s) - Easy in-out easing
/// - **Snappy** (0.3s) - Quick spring animation
/// - **Gentle** (0.7s) - Slow, relaxed spring
/// - **Responsive** (0.35s) - Default interaction timing
/// - **Spring Small** (0.25s) - Bouncy, quick
/// - **Spring Medium** (0.45s) - Balanced bounce
/// - **Spring Large** (0.65s) - Relaxed bounce
///
/// ### 2. Interaction Animations (`InteractionAnimations.swift`)
/// Direct user interaction animations:
/// - **Button Press** - Scale + opacity feedback
/// - **Card Press** - 3D rotation + shadow depth
/// - **Card Lift** - Hover elevation effect
/// - **Card Expand** - Controlled scale animation
/// - **Card Collapse** - Reverse expand
/// - **Hero Expand** - Large scale transition
/// - **Hero Collapse** - Large reverse transition
/// - **Floating** - Continuous vertical bobbing
/// - **Breathing** - Scale pulse (inhale/exhale)
/// - **Pulse** - Opacity pulse for attention
/// - **Bounce** - Vertical bounce effect
/// - **Fade** - Smooth opacity transition
/// - **Scale** - Smooth scaling transition
/// - **Blur** - Gradual blur application
/// - **Depth Shift** - 3D perspective shift
///
/// ### 3. Scroll Animations (`ScrollAnimations.swift`)
/// Animations triggered by scroll events:
/// - **ScrollTransition** - Opacity + scale on scroll
/// - **Parallax** - Depth-based offset
/// - **Stretch Header** - Stretchable hero image
/// - **Large Title Collapse** - Title scale on scroll
/// - **Navigation Blur** - Navbar blur on scroll
/// - **Background Depth** - Scale + opacity depth
/// - **Floating Card Motion** - Card tilt on scroll
///
/// ### 4. Navigation Animations (`NavigationAnimations.swift`)
/// Screen transition animations:
/// - **Push** - Right-to-left entrance
/// - **Pop** - Left-to-right exit
/// - **Sheet** - Bottom-to-top presentation
/// - **Full Screen** - Center-scale presentation
/// - **Bottom Sheet** - Partial bottom presentation
/// - **Hero Transition** - Matched geometry transitions
///
/// ### 5. Icon Animations (`IconAnimations.swift`)
/// Symbol and icon-specific animations:
/// - **SymbolEffect** - Native SF Symbol animations
/// - **Icon Bounce** - Vertical bounce
/// - **Icon Pulse** - Scale + opacity pulse
/// - **Icon Variable Color** - Color animation
/// - **Icon Appear** - Scale in + fade
/// - **Icon Disappear** - Scale out + fade
/// - **Icon Replace** - Rotation flip transition
///
/// ### 6. State Animations (`StateAnimations.swift`)
/// App state transition animations:
/// - **Loading** - Spinning rotation
/// - **Empty** - Subtle breathing pulse
/// - **Success** - Scale in celebration
/// - **Error** - Shake feedback
/// - **Refresh** - Loading indicator
/// - **Content Swap** - Directional slide + fade
///
/// ### 7. Touch Tracking (`TouchTracking.swift`)
/// Gesture recognition helpers:
/// - **onTouchDown** - Detects press start
/// - **onTouchUp** - Detects press end
///
/// ## Usage Examples
///
/// ### Basic Button Animation
/// ```swift
/// Button("Press Me") { }
///     .buttonStyle(.plain)
///     .buttonPress(isPressed: isPressed, hapticFeedback: true)
/// ```
///
/// ### Card with Lift Effect
/// ```swift
/// Card {
///     Text("Hello")
/// }
/// .cardLift(isHovering: isHovering, elevation: 12)
/// ```
///
/// ### Scroll Animation
/// ```swift
/// Text("Title")
///     .largeTitleCollapse(scrollOffset: scrollOffset, threshold: 50)
/// ```
///
/// ### State Animation
/// ```swift
/// LoadingIndicator()
///     .loadingState(duration: 2.0)
/// ```
///
/// ### Using Presets
/// ```swift
/// Text("Floating Text")
///     .floatingAnimation(offset: 8, duration: 2.5)
/// ```
///
/// ## Accessibility
///
/// **All animations respect Reduce Motion accessibility setting.**
///
/// When `@Environment(\.accessibilityReduceMotion)` is true:
/// - Animations complete in 0.01 seconds
/// - Visual feedback still occurs instantly
/// - Haptic feedback still works
///
/// Example:
/// ```swift
/// @Environment(\.accessibilityReduceMotion) var reduceMotion
///
/// func body: some View {
///     Text("Content")
///         .animation(
///             reduceMotion ? .linear(duration: 0.01) : .spring(...),
///             value: isActive
///         )
/// }
/// ```
///
/// ## Performance Notes
///
/// - All animations target 60fps+ on supported devices
/// - CADisplayLink synchronization where available
/// - GPU-accelerated transforms (scale, rotation, offset)
/// - Opacity changes for optimal rendering
/// - No expensive blur calculations on every frame
///
/// Profiling Tips:
/// - Use Core Animation tool in Instruments
/// - Check "Color Offscreen Rendered" in simulator
/// - Monitor frame rate with Xcode metrics
///
/// ## Integration with Design System
///
/// All Design System components use the Motion system:
/// - Buttons get button press animation
/// - Cards get lift and expand animations
/// - Carousels use scroll transitions
/// - State indicators use state animations
/// - Icons use symbol animations
///
/// See `MotionSystemIntegration.swift` for component presets.
///
/// ## Color & Dark Mode
///
/// Motion animations don't change colors or opacity significantly:
/// - Shadows respect light/dark mode through OS
/// - Scale and rotation are color-independent
/// - Blur uses system backdrop materials
///
/// ## Dynamic Type Support
///
/// All animations are independent of text size:
/// - Animation durations remain consistent
/// - Scale factors remain proportional
/// - Spacing adjusts with layout, not animation
///
/// ## Extending the System
///
/// To add new animations:
///
/// 1. Create a ViewModifier in appropriate file
/// 2. Add @Environment(\.accessibilityReduceMotion) check
/// 3. Use MotionTiming or MotionSpring for consistency
/// 4. Add View extension for easy use
/// 5. Document in relevant integration file
/// 6. Test with Reduce Motion enabled
///
/// Example:
/// ```swift
/// struct MyAnimation: ViewModifier {
///     @Environment(\.accessibilityReduceMotion) var reduceMotion
///
///     func body(content: Content) -> some View {
///         content
///             .animation(
///                 reduceMotion ? .linear(duration: 0.01) :
///                     .spring(response: 0.4, dampingFraction: 0.8),
///                 value: someValue
///             )
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// 1. **Timing Consistency** - Use MotionTiming presets
/// 2. **Haptic Feedback** - Add haptics to button interactions
/// 3. **Reduced Motion** - Always respect accessibility
/// 4. **Layered Animations** - Combine animations for depth
/// 5. **Duration Matching** - Keep related animations synced
/// 6. **Easing Curves** - Use springs for natural motion
/// 7. **Subtle Movements** - Small scale changes (0.95-1.05)
/// 8. **Shadow Matching** - Shadow depth matches elevation
///
/// ## References
///
/// - Apple Human Interface Guidelines: Motion
/// - iOS 26 First-Party App Animations
/// - SwiftUI Animation Documentation
/// - Core Animation Performance Tips
///
public struct PHASE5_MOTION_SYSTEM {}
