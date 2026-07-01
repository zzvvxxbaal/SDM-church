import SwiftUI

enum AnimationProvider {
    
    static let snappy = Animation.snappy(duration: 0.3, extraBounce: 0.1)
    static let smooth = Animation.easeInOut(duration: 0.3)
    static let spring = Animation.spring(response: 0.5, dampingFraction: 0.7)
    static let lightSpring = Animation.spring(response: 0.4, dampingFraction: 0.8)
    static let interactiveSpring = Animation.spring(response: 0.35, dampingFraction: 0.65)
    
    static func bouncy(duration: Double = 0.5) -> Animation {
        .spring(response: duration, dampingFraction: 0.6, blendDuration: 0)
    }
    
    static func elastic(duration: Double = 0.6) -> Animation {
        .spring(response: duration, dampingFraction: 0.5, blendDuration: 0)
    }
    
}
