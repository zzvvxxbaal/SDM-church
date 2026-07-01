import SwiftUI

enum Springs {

    static let button = Animation.spring(
        response: 0.35,
        dampingFraction: 0.75,
        blendDuration: 0
    )

    static let card = Animation.spring(
        response: 0.45,
        dampingFraction: 0.80,
        blendDuration: 0
    )

    static let sheet = Animation.spring(
        response: 0.50,
        dampingFraction: 0.85,
        blendDuration: 0
    )
    
    static let snappy = Animation.spring(
        response: 0.25,
        dampingFraction: 0.65,
        blendDuration: 0
    )
    
    static let smooth = Animation.spring(
        response: 0.60,
        dampingFraction: 0.90,
        blendDuration: 0
    )
    
    static let gentle = Animation.spring(
        response: 0.70,
        dampingFraction: 0.95,
        blendDuration: 0
    )
    
    static let bouncy = Animation.spring(
        response: 0.55,
        dampingFraction: 0.60,
        blendDuration: 0
    )
    
    static let floating = Animation.easeInOut(duration: 2.0)
    
    static let morphing = Animation.spring(
        response: 0.40,
        dampingFraction: 0.78,
        blendDuration: 0
    )

}
