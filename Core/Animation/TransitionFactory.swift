import SwiftUI

enum TransitionFactory {
    
    static var slideIn: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .move(edge: .leading).combined(with: .opacity)
        )
    }
    
    static var scaleIn: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .scale.combined(with: .opacity),
            removal: .opacity
        )
    }
    
    static var fadeInUp: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .bottom).combined(with: .opacity),
            removal: .opacity
        )
    }
    
    static var fadeInDown: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .top).combined(with: .opacity),
            removal: .opacity
        )
    }
    
    static func custom(
        insertion: AnyTransition,
        removal: AnyTransition
    ) -> AnyTransition {
        AnyTransition.asymmetric(insertion: insertion, removal: removal)
    }
    
}
