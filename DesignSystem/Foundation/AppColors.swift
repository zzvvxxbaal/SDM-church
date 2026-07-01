import SwiftUI

enum AppColors {
    
    static let tint = Color(red: 0.2, green: 0.4, blue: 0.8)
    static let background = Color(UIColor.systemBackground)
    static let surface = Color(UIColor { $0.userInterfaceStyle == .dark ? UIColor(red: 0.11, green: 0.11, blue: 0.12) : .white })
    static let surfaceSecondary = Color(UIColor { $0.userInterfaceStyle == .dark ? UIColor(red: 0.17, green: 0.17, blue: 0.18) : UIColor(red: 0.97, green: 0.97, blue: 0.98) })
    
    static let text = Color(UIColor.label)
    static let textSecondary = Color(UIColor.secondaryLabel)
    static let textTertiary = Color(UIColor.tertiaryLabel)
    
    static let separator = Color(UIColor.separator)
    static let glass = Color.white.opacity(0.08)
    
    static let success = Color(red: 0.34, green: 0.84, blue: 0.39)
    static let warning = Color(red: 1.0, green: 0.84, blue: 0.0)
    static let error = Color(red: 1.0, green: 0.23, blue: 0.19)
    static let info = Color(red: 0.2, green: 0.68, blue: 1.0)
    
}
