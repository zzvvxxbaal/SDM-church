import SwiftUI
import Observation

@Observable
final class GlassEnvironment {
    var colorScheme: ColorScheme = .light
    var isHighContrast: Bool = false
    var isReduceTransparency: Bool = false
    var isReduceMotion: Bool = false
    var lightingDirection: CGPoint = CGPoint(x: 0.3, y: 0.3)
    var ambientLighting: CGFloat = 1.0
    var isDarkMode: Bool = false
    var performanceMode: GlassPerformanceMode = .standard
    
    static let shared = GlassEnvironment()
    
    init() {}
    
    func updateForColorScheme(_ scheme: ColorScheme) {
        colorScheme = scheme
        isDarkMode = scheme == .dark
    }
    
    func updateLighting(_ point: CGPoint) {
        lightingDirection = point
    }
    
    func setPerformanceMode(_ mode: GlassPerformanceMode) {
        performanceMode = mode
    }
    
    func enableHighContrast(_ enabled: Bool) {
        isHighContrast = enabled
    }
    
    func enableReduceTransparency(_ enabled: Bool) {
        isReduceTransparency = enabled
    }
    
    func enableReduceMotion(_ enabled: Bool) {
        isReduceMotion = enabled
    }
}

extension View {
    func glassEnvironment(_ environment: GlassEnvironment) -> some View {
        self.preference(key: GlassEnvironmentPreferenceKey.self, value: environment)
    }
}

struct GlassEnvironmentPreferenceKey: PreferenceKey {
    static var defaultValue: GlassEnvironment = .shared
    
    static func reduce(value: inout GlassEnvironment, nextValue: () -> GlassEnvironment) {
        value = nextValue()
    }
}
