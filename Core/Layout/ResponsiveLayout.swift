import SwiftUI

struct ResponsiveLayout {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var isCompact: Bool {
        horizontalSizeClass == .compact || verticalSizeClass == .compact
    }
    
    var isRegular: Bool {
        horizontalSizeClass == .regular && verticalSizeClass == .regular
    }
    
    var columns: [GridItem] {
        isRegular
            ? [
                GridItem(.flexible(), spacing: LayoutGuide.Spacing.medium),
                GridItem(.flexible(), spacing: LayoutGuide.Spacing.medium)
            ]
            : [GridItem(.flexible())]
    }
    
    var contentWidth: CGFloat {
        isRegular ? 600 : UIScreen.main.bounds.width - 32
    }
    
}

extension View {
    
    func responsiveWidth(_ compact: CGFloat, _ regular: CGFloat) -> some View {
        #if os(iOS)
        return self
            .frame(maxWidth: UIScreen.main.bounds.width > 600 ? regular : compact)
        #else
        return self.frame(maxWidth: regular)
        #endif
    }
    
}
