import SwiftUI

enum GlassProvider {
    
    static let materialOpacity: Double = 0.08
    static let blurRadius: CGFloat = 30
    static let shadowRadius: CGFloat = 24
    
    static let cornerRadius: CGFloat = 34
    static let borderWidth: CGFloat = 1.5
    
    static let highlightOpacity: Double = 0.3
    static let reflectionOpacity: Double = 0.1
    static let causticOpacity: Double = 0.05
    
    enum Material {
        case ultraThin
        case thin
        case regular
    }
    
    static func materialOpacity(for material: Material) -> Double {
        switch material {
        case .ultraThin: return 0.05
        case .thin: return 0.08
        case .regular: return 0.12
        }
    }
    
}
