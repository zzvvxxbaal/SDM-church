import SwiftUI

struct GlassPerformanceOptimizer {
    static func selectConfiguration(
        preferredMode: GlassPerformanceMode,
        availableMemory: UInt64,
        screenScale: CGFloat
    ) -> GlassConfiguration {
        let megabytesAvailable = availableMemory / 1_000_000
        let isLowMemory = megabytesAvailable < 500
        let isHighDensity = screenScale > 2.5
        
        if isLowMemory {
            return .performance
        }
        
        if preferredMode == .ultraQuality && !isHighDensity {
            return .quality
        }
        
        return preferredMode == .performance ? .performance :
               preferredMode == .ultraQuality ? .ultraQuality :
               .standard
    }
    
    static func optimizeForDevice() -> GlassPerformanceMode {
        let screen = UIScreen.main
        let scale = screen.scale
        let bounds = screen.bounds
        let pixelCount = bounds.width * bounds.height * scale * scale
        
        if pixelCount > 2_000_000 {
            return .performance
        }
        
        if pixelCount > 1_500_000 {
            return .standard
        }
        
        return .quality
    }
    
    static func shouldEnableDynamicEffects(performanceMode: GlassPerformanceMode) -> Bool {
        performanceMode != .performance
    }
    
    static func getOptimizedBlurRadius(
        baseRadius: CGFloat,
        performanceMode: GlassPerformanceMode
    ) -> CGFloat {
        switch performanceMode {
        case .performance:
            return baseRadius * 0.6
        case .standard:
            return baseRadius * 0.8
        case .quality:
            return baseRadius * 1.0
        case .ultraQuality:
            return baseRadius * 1.2
        }
    }
    
    static func getCacheStrategy(performanceMode: GlassPerformanceMode) -> GlassCacheStrategy {
        switch performanceMode {
        case .performance:
            return .aggressive
        case .standard:
            return .moderate
        case .quality, .ultraQuality:
            return .minimal
        }
    }
}

enum GlassCacheStrategy {
    case aggressive
    case moderate
    case minimal
}

class GlassRenderingCache {
    static let shared = GlassRenderingCache()
    private var cache: [String: Any] = [:]
    private let lock = NSLock()
    private let maxCacheSize = 50
    
    private init() {}
    
    func cache<T>(_ value: T, forKey key: String) {
        lock.lock()
        defer { lock.unlock() }
        
        if cache.count >= maxCacheSize {
            cache.removeAll()
        }
        
        cache[key] = value
    }
    
    func value<T>(forKey key: String) -> T? {
        lock.lock()
        defer { lock.unlock() }
        
        return cache[key] as? T
    }
    
    func clear() {
        lock.lock()
        defer { lock.unlock() }
        
        cache.removeAll()
    }
}

struct GlassPerformanceMonitor: ViewModifier {
    @State private var frameCount = 0
    @State private var lastFrameTime = CFAbsoluteTimeGetCurrent()
    @State private var fps: Double = 60.0
    @State private var displayLink: CADisplayLink?
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                setupDisplayLink()
            }
            .onDisappear {
                displayLink?.invalidate()
            }
    }
    
    private func setupDisplayLink() {
        let newDisplayLink = CADisplayLink(
            target: PerformanceTarget.shared,
            selector: #selector(PerformanceTarget.update)
        )
        newDisplayLink.add(to: .main, forMode: .common)
        displayLink = newDisplayLink
    }
}

class PerformanceTarget {
    static let shared = PerformanceTarget()
    var frameCount = 0
    var lastTime = CFAbsoluteTimeGetCurrent()
    var fps: Double = 60.0
    
    @objc func update() {
        frameCount += 1
        let now = CFAbsoluteTimeGetCurrent()
        let elapsed = now - lastTime
        
        if elapsed >= 1.0 {
            fps = Double(frameCount) / elapsed
            frameCount = 0
            lastTime = now
        }
    }
}

extension View {
    func glassPerformanceMonitored() -> some View {
        modifier(GlassPerformanceMonitor())
    }
}
