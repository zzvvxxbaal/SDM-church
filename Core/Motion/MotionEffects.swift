import SwiftUI

enum MotionEffects {
    
    static func parallax(_ offset: CGFloat, factor: CGFloat = 0.5) -> CGPoint {
        CGPoint(x: offset * factor, y: offset * factor * 0.5)
    }
    
    static func scale(for pressProgress: Double) -> CGFloat {
        1.0 - (pressProgress * 0.1)
    }
    
    static func opacity(for pressProgress: Double) -> Double {
        1.0 - (pressProgress * 0.2)
    }
    
}

extension View {
    
    func scaleEffect(on pressProgress: Double) -> some View {
        self.scaleEffect(MotionEffects.scale(for: pressProgress))
    }
    
    func parallaxEffect(_ offset: CGFloat) -> some View {
        self.offset(
            x: MotionEffects.parallax(offset).x,
            y: MotionEffects.parallax(offset).y
        )
    }
    
}
