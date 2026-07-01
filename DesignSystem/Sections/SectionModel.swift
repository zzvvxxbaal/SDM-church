import SwiftUI

struct SectionModel: Identifiable {
    let id: String
    let title: String
    let subtitle: String?
    let icon: String?
    let backgroundColor: Color
    let showSeeAll: Bool
    let seeAllAction: (() -> Void)?
    
    init(
        id: String = UUID().uuidString,
        title: String,
        subtitle: String? = nil,
        icon: String? = nil,
        backgroundColor: Color = .clear,
        showSeeAll: Bool = false,
        seeAllAction: (() -> Void)? = nil
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.backgroundColor = backgroundColor
        self.showSeeAll = showSeeAll
        self.seeAllAction = seeAllAction
    }
}

enum SectionHeaderSize {
    case large
    case medium
    case small
    
    var titleFont: Font {
        switch self {
        case .large:
            return .system(size: 28, weight: .bold)
        case .medium:
            return .system(size: 22, weight: .bold)
        case .small:
            return .system(size: 17, weight: .semibold)
        }
    }
    
    var subtitleFont: Font {
        switch self {
        case .large:
            return .system(size: 17, weight: .regular)
        case .medium:
            return .system(size: 15, weight: .regular)
        case .small:
            return .system(size: 13, weight: .regular)
        }
    }
    
    var spacing: CGFloat {
        switch self {
        case .large:
            return 12
        case .medium:
            return 8
        case .small:
            return 4
        }
    }
}
