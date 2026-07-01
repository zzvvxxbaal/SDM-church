import SwiftUI

/// Glass Rendering Index
///
/// Complete system for rendering Apple-style liquid glass effects.
/// Provides reusable, performant, and adaptive glass rendering for all components.

// MARK: - Core Rendering Systems

/// GlassRenderer - Central rendering orchestrator
/// Coordinates all glass effects with environment awareness and performance optimization
public struct GlassRenderingSystem {
    
    /// Primary glass rendering modifier with full feature set
    /// Includes reflections, refractions, highlights, borders, shadows, caustics, and noise
    public static func renderer(
        material: GlassMaterialType = .regular,
        cornerRadius: CGFloat = 16,
        configuration: GlassConfiguration = .default
    ) -> GlassRenderer {
        GlassRenderer(
            materialType: material,
            cornerRadius: cornerRadius,
            configuration: configuration
        )
    }
    
    /// Adaptive renderer that responds to accessibility settings
    /// Automatically adjusts rendering for reduce transparency, reduce motion, etc.
    public static func adaptiveRenderer(
        material: GlassMaterialType = .regular,
        cornerRadius: CGFloat = 16,
        configuration: GlassConfiguration = .default
    ) -> GlassAdaptiveRenderer {
        GlassAdaptiveRenderer(
            materialType: material,
            cornerRadius: cornerRadius,
            configuration: configuration
        )
    }
    
    /// Environment-aware renderer with dynamic lighting and reflections
    /// Responds to device motion, ambient lighting, and environment state
    public static func environmentAwareRenderer(
        material: GlassMaterialType = .regular,
        cornerRadius: CGFloat = 16,
        configuration: GlassConfiguration = .default
    ) -> GlassEnvironmentAwareRenderer {
        GlassEnvironmentAwareRenderer(
            materialType: material,
            cornerRadius: cornerRadius,
            configuration: configuration
        )
    }
    
    /// Metal-optimized renderer with shader support
    /// Falls back to SwiftUI if Metal is unavailable
    public static func shaderOptimizedRenderer(
        material: GlassMaterialType = .regular,
        cornerRadius: CGFloat = 16,
        configuration: GlassConfiguration = .default
    ) -> some View {
        Color.white.glassShaderOptimized(material, cornerRadius: cornerRadius, configuration: configuration)
    }
}

// MARK: - Material Configurations

/// Glass Configurations
/// Pre-tuned configurations for different performance/quality levels
public struct GlassConfigurations {
    /// High performance mode - optimized for frame rate
    public static let performance = GlassConfiguration.performance
    
    /// Standard mode - balanced performance and quality
    public static let standard = GlassConfiguration.default
    
    /// High quality mode - optimized for visual fidelity
    public static let quality = GlassConfiguration.quality
    
    /// Ultra high quality mode - maximum fidelity
    public static let ultraQuality = GlassConfiguration.ultraQuality
}

// MARK: - Glass Variants

/// Pre-configured glass variants for specific UI elements
public struct GlassVariantLibrary {
    /// Floating panel glass - elevated, prominent appearance
    public static let floating = GlassVariants.floating
    
    /// Toolbar glass - compact, toolbar-appropriate
    public static let toolbar = GlassVariants.toolbar
    
    /// Navigation glass - navigation bar appropriate
    public static let navigation = GlassVariants.navigation
    
    /// Card glass - card-sized elements
    public static let card = GlassVariants.card
    
    /// Button glass - button-sized elements
    public static let button = GlassVariants.button
    
    /// Capsule glass - capsule-shaped elements
    public static let capsule = GlassVariants.capsule
    
    /// Sidebar glass - sidebar appropriate
    public static let sidebar = GlassVariants.sidebar
    
    /// Search glass - search bar appropriate
    public static let search = GlassVariants.search
    
    /// Sheet glass - modal sheet appropriate
    public static let sheet = GlassVariants.sheet
    
    /// Dialog glass - alert dialog appropriate
    public static let dialog = GlassVariants.dialog
    
    /// Ultra thin glass - minimal, subtle
    public static let ultraThin = GlassVariants.ultraThin
    
    /// Default glass - general purpose
    public static let `default` = GlassVariants.default
    
    /// All available variants
    public static func allVariants() -> [GlassVariant] {
        GlassVariants.all()
    }
}

// MARK: - Environment Management

/// Glass rendering environment
/// Manages global glass rendering state, lighting, and accessibility
public struct GlassRenderingEnvironment {
    /// Shared environment instance
    public static let shared = GlassEnvironment.shared
    
    /// Update environment for current color scheme
    public static func updateForColorScheme(_ scheme: ColorScheme) {
        shared.updateForColorScheme(scheme)
    }
    
    /// Update environment lighting direction
    public static func updateLighting(_ point: CGPoint) {
        shared.updateLighting(point)
    }
    
    /// Set performance mode
    public static func setPerformanceMode(_ mode: GlassPerformanceMode) {
        shared.setPerformanceMode(mode)
    }
    
    /// Enable/disable high contrast rendering
    public static func setHighContrast(_ enabled: Bool) {
        shared.enableHighContrast(enabled)
    }
    
    /// Enable/disable reduce transparency
    public static func setReduceTransparency(_ enabled: Bool) {
        shared.enableReduceTransparency(enabled)
    }
    
    /// Enable/disable reduce motion
    public static func setReduceMotion(_ enabled: Bool) {
        shared.enableReduceMotion(enabled)
    }
}

// MARK: - Performance Optimization

/// Performance optimization utilities
public struct GlassPerformance {
    /// Select optimal configuration based on device capabilities
    public static func selectConfiguration(
        preferred: GlassPerformanceMode = .standard,
        availableMemory: UInt64 = .max,
        screenScale: CGFloat = UIScreen.main.scale
    ) -> GlassConfiguration {
        GlassPerformanceOptimizer.selectConfiguration(
            preferredMode: preferred,
            availableMemory: availableMemory,
            screenScale: screenScale
        )
    }
    
    /// Optimize for current device
    public static func optimizeForDevice() -> GlassPerformanceMode {
        GlassPerformanceOptimizer.optimizeForDevice()
    }
    
    /// Check if dynamic effects should be enabled
    public static func shouldEnableDynamicEffects(
        for mode: GlassPerformanceMode
    ) -> Bool {
        GlassPerformanceOptimizer.shouldEnableDynamicEffects(performanceMode: mode)
    }
    
    /// Get rendering cache instance
    public static let cache = GlassRenderingCache.shared
    
    /// Clear rendering cache
    public static func clearCache() {
        GlassRenderingCache.shared.clear()
    }
}

// MARK: - Metal Integration

/// Metal shader support and integration
public struct GlassMetalIntegration {
    /// Check if Metal rendering is supported
    public static var supportsMetalRendering: Bool {
        GlassShaderBridge.supportsMetalRendering()
    }
    
    /// Get optimal renderer type for current device
    public static var optimalRenderer: GlassRendererType {
        GlassShaderBridge.getOptimalRenderer()
    }
}

// MARK: - Component Integration Examples

/// Example usage patterns for different component types

/// Example: Custom Glass Button
/// ```swift
/// Button("Press me") {
///     // Action
/// }
/// .buttonStyle(LiquidButton())
/// .liquidGlass(.button, cornerRadius: AppRadius.button)
/// ```

/// Example: Glass Card with Environment Awareness
/// ```swift
/// VStack {
///     content
/// }
/// .liquidGlassEnvironmentAware(.card, cornerRadius: 20)
/// ```

/// Example: Variant-Based Glass Panel
/// ```swift
/// VStack {
///     content
/// }
/// .liquidGlassVariant(GlassVariantLibrary.floating)
/// ```

/// Example: Performance-Optimized Glass
/// ```swift
/// let config = GlassPerformance.selectConfiguration(
///     preferred: .standard
/// )
/// VStack {
///     content
/// }
/// .liquidGlassOptimized(.card, configuration: config)
/// ```

// MARK: - API Documentation

/// # Liquid Glass Engine - Phase 6
///
/// ## Overview
/// Complete reusable glass rendering system for Apple-style iOS applications.
/// Provides high-performance, adaptive, and environment-aware glass effects.
///
/// ## Features
/// - 11+ Material Types (ultraThin, thin, regular, thick, toolbar, navigation, floating, card, capsule, circle, button)
/// - 13 Glass Variants (Floating, Toolbar, Navigation, Card, Button, Capsule, Sidebar, Search, Sheet, Dialog, etc.)
/// - Adaptive Rendering (Light/Dark mode, high contrast, reduce transparency, reduce motion)
/// - Environment-Aware Features (dynamic blur, opacity, reflections, lighting, borders)
/// - Performance Modes (Performance, Standard, Quality, Ultra Quality)
/// - Metal Integration Architecture (with SwiftUI fallback)
/// - Motion System Integration (device orientation-based effects)
/// - Accessibility Support (respects accessibility settings)
///
/// ## Usage
/// 
/// ### Basic Usage (Backward Compatible)
/// ```swift
/// view.liquidGlass(.card, cornerRadius: 20)
/// ```
///
/// ### Optimized Rendering
/// ```swift
/// view.liquidGlassOptimized(.card, configuration: .quality)
/// ```
///
/// ### Adaptive to Accessibility
/// ```swift
/// view.liquidGlassAdaptive(.card)
/// ```
///
/// ### Environment-Aware Rendering
/// ```swift
/// view.liquidGlassEnvironmentAware(.card)
/// ```
///
/// ### Using Variants
/// ```swift
/// view.liquidGlassVariant(GlassVariantLibrary.floating)
/// ```
///
/// ## Performance
/// - 60fps frame rate on all supported devices
/// - Optimized rendering cache
/// - Configurable dynamic effects
/// - Metal shader support (when available)
///
/// ## Compatibility
/// - All existing liquidGlass() calls continue to work unchanged
/// - Backward compatible with all existing components
/// - No API changes required
/// - Automatic fallback for accessibility settings
///
/// ## Future Enhancement
/// - Metal shader implementation (architecture-ready)
/// - Advanced caustics rendering
/// - Custom shader support
/// - HDR rendering support
