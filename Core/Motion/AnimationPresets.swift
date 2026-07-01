import SwiftUI

// MARK: - Animation Timing Curves

public enum MotionTiming {
    case instant
    case smooth
    case snappy
    case gentle
    case responsive
    case springSmall
    case springMedium
    case springLarge
    
    public var animation: Animation {
        switch self {
        case .instant:
            return .linear(duration: 0.1)
        case .smooth:
            return .easeInOut(duration: 0.4)
        case .snappy:
            return .spring(response: 0.3, dampingFraction: 0.75, blendDuration: 0)
        case .gentle:
            return .spring(response: 0.7, dampingFraction: 0.95, blendDuration: 0)
        case .responsive:
            return .spring(response: 0.35, dampingFraction: 0.75, blendDuration: 0)
        case .springSmall:
            return .spring(response: 0.25, dampingFraction: 0.65, blendDuration: 0)
        case .springMedium:
            return .spring(response: 0.45, dampingFraction: 0.80, blendDuration: 0)
        case .springLarge:
            return .spring(response: 0.65, dampingFraction: 0.90, blendDuration: 0)
        }
    }
    
    public var duration: Double {
        switch self {
        case .instant:
            return 0.1
        case .smooth:
            return 0.4
        case .snappy:
            return 0.3
        case .gentle:
            return 0.7
        case .responsive:
            return 0.35
        case .springSmall:
            return 0.25
        case .springMedium:
            return 0.45
        case .springLarge:
            return 0.65
        }
    }
}

// MARK: - Accessible Animation Wrapper

public struct MotionAnimation {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public static func with(
        timing: MotionTiming,
        reduceMotion: Bool = false
    ) -> Animation {
        if reduceMotion {
            return .linear(duration: 0.01)
        }
        return timing.animation
    }
}

// MARK: - Spring Presets

public enum MotionSpring {
    case button
    case card
    case sheet
    case snappy
    case smooth
    case gentle
    case bouncy
    case floating
    case morphing
    
    public var animation: Animation {
        switch self {
        case .button:
            return .spring(response: 0.35, dampingFraction: 0.75, blendDuration: 0)
        case .card:
            return .spring(response: 0.45, dampingFraction: 0.80, blendDuration: 0)
        case .sheet:
            return .spring(response: 0.50, dampingFraction: 0.85, blendDuration: 0)
        case .snappy:
            return .spring(response: 0.25, dampingFraction: 0.65, blendDuration: 0)
        case .smooth:
            return .spring(response: 0.60, dampingFraction: 0.90, blendDuration: 0)
        case .gentle:
            return .spring(response: 0.70, dampingFraction: 0.95, blendDuration: 0)
        case .bouncy:
            return .spring(response: 0.55, dampingFraction: 0.60, blendDuration: 0)
        case .floating:
            return .easeInOut(duration: 2.0)
        case .morphing:
            return .spring(response: 0.40, dampingFraction: 0.78, blendDuration: 0)
        }
    }
}

// MARK: - Motion Configuration

public struct MotionConfig {
    public let isEnabled: Bool
    public let respectsReduceMotion: Bool
    public let defaultTiming: MotionTiming
    
    public static let `default` = MotionConfig(
        isEnabled: true,
        respectsReduceMotion: true,
        defaultTiming: .responsive
    )
    
    public static let reduced = MotionConfig(
        isEnabled: true,
        respectsReduceMotion: true,
        defaultTiming: .instant
    )
}
