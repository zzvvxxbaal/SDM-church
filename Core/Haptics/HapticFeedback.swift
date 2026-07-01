import UIKit

enum HapticFeedback {
    
    case light
    case medium
    case heavy
    case success
    case warning
    case error
    
    func trigger() {
        switch self {
        case .light:
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        case .medium:
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        case .heavy:
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        case .success, .warning, .error:
            let generator = UINotificationFeedbackGenerator()
            let type: UINotificationFeedbackGenerator.FeedbackType
            
            switch self {
            case .success: type = .success
            case .warning: type = .warning
            case .error: type = .error
            default: return
            }
            
            generator.notificationOccurred(type)
        }
    }
    
}
