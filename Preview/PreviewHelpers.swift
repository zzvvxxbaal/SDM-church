import SwiftUI

#if DEBUG

struct PreviewContainer<Content: View>: View {
    
    let content: Content
    let colorScheme: ColorScheme?
    let sizeCategories: [ContentSizeCategory]
    
    init(
        colorScheme: ColorScheme? = .light,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.colorScheme = colorScheme
        self.sizeCategories = [.medium]
    }
    
    var body: some View {
        ForEach(sizeCategories, id: \.self) { sizeCategory in
            content
                .preferredColorScheme(colorScheme)
                .environment(\.sizeCategory, sizeCategory)
                .previewDisplayName("Size: \(sizeCategory.description)")
        }
    }
    
}

extension ContentSizeCategory {
    
    var description: String {
        switch self {
        case .extraSmall: return "XS"
        case .small: return "S"
        case .medium: return "M"
        case .large: return "L"
        case .extraLarge: return "XL"
        case .extraExtraLarge: return "XXL"
        case .extraExtraExtraLarge: return "XXXL"
        default: return "Accessibility"
        }
    }
    
}

#endif
