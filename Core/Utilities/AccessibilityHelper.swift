import SwiftUI

enum AccessibilityHelper {
    
    static let minTapTargetSize: CGFloat = 44
    static let minInteractiveSize: CGFloat = 44
    
    static func formatForAccessibility(_ value: String) -> String {
        value
            .replacingOccurrences(of: "  ", with: " ")
            .trimmingCharacters(in: .whitespaces)
    }
    
}

extension View {
    
    func accessibleButton(label: String, hint: String? = nil) -> some View {
        self
            .accessibilityLabel(label)
            .accessibilityHint(hint ?? "")
            .accessibilityAddTraits(.isButton)
    }
    
    func accessibleHeader(level: AccessibilityHeadingLevel = .h1) -> some View {
        self
            .accessibilityAddTraits(.isHeader)
    }
    
}
