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
            return AppFonts.title
        case .medium:
            return AppFonts.title2
        case .small:
            return AppFonts.headline
        }
    }

    var subtitleFont: Font {
        switch self {
        case .large:
            return AppFonts.body
        case .medium:
            return AppFonts.subheadline
        case .small:
            return AppFonts.caption1
        }
    }

    var spacing: CGFloat {
        switch self {
        case .large:
            return AppSpacing.compact
        case .medium:
            return AppSpacing.small
        case .small:
            return AppSpacing.xSmall
        }
    }

    var iconFont: Font {
        switch self {
        case .large:
            return AppFonts.title2
        case .medium:
            return AppFonts.headline
        case .small:
            return AppFonts.subheadline.weight(.semibold)
        }
    }
}
