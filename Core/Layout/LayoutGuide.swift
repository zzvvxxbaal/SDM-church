import SwiftUI

enum LayoutGuide {
    
    enum Spacing {
        static let xSmall: CGFloat = 4
        static let small: CGFloat = 8
        static let medium: CGFloat = 16
        static let large: CGFloat = 24
        static let xLarge: CGFloat = 32
        static let xxLarge: CGFloat = 48
    }
    
    enum Radius {
        static let button: CGFloat = 30
        static let card: CGFloat = 34
        static let sheet: CGFloat = 40
        static let dialog: CGFloat = 36
        static let avatar: CGFloat = 999
    }
    
    enum Padding {
        static let edge: CGFloat = 16
        static let container: CGFloat = 20
    }
    
    static func responsiveSpacing(_ base: CGFloat, sizeClass: UserInterfaceSizeClass? = nil) -> CGFloat {
        guard let sizeClass = sizeClass, sizeClass == .regular else { return base }
        return base * 1.2
    }
    
}
