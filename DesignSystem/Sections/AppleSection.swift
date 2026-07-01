import SwiftUI

struct AppleSectionHeader: View {
    let title: String
    let subtitle: String?
    let size: SectionHeaderSize
    let icon: String?
    let showSeeAll: Bool
    let seeAllAction: (() -> Void)?
    
    init(
        title: String,
        subtitle: String? = nil,
        size: SectionHeaderSize = .large,
        icon: String? = nil,
        showSeeAll: Bool = false,
        seeAllAction: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.size = size
        self.icon = icon
        self.showSeeAll = showSeeAll
        self.seeAllAction = seeAllAction
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: size.spacing) {
            HStack(alignment: .top, spacing: AppSpacing.medium) {
                VStack(alignment: .leading, spacing: size.spacing) {
                    HStack(spacing: AppSpacing.small) {
                        if let icon = icon {
                            Image(systemName: icon)
                                .font(.system(size: size == .large ? 24 : 18, weight: .semibold))
                                .foregroundStyle(AppColors.tint)
                        }
                        Text(title)
                            .font(size.titleFont)
                            .lineLimit(1)
                    }
                    
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(size.subtitleFont)
                            .foregroundStyle(.secondary)
                            .lineLimit(2)
                    }
                }
                
                Spacer(minLength: AppSpacing.medium)
                
                if showSeeAll {
                    Button(action: { seeAllAction?() }) {
                        HStack(spacing: AppSpacing.xSmall) {
                            Text("모두보기")
                                .font(.system(size: 13, weight: .semibold))
                            Image(systemName: "chevron.right")
                                .font(.system(size: 12, weight: .semibold))
                        }
                        .foregroundStyle(AppColors.tint)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct AppleSection<Content: View>: View {
    let header: AppleSectionHeader?
    let content: Content
    let spacing: CGFloat
    
    init(
        title: String? = nil,
        subtitle: String? = nil,
        size: SectionHeaderSize = .large,
        icon: String? = nil,
        showSeeAll: Bool = false,
        seeAllAction: (() -> Void)? = nil,
        spacing: CGFloat = AppSpacing.large,
        @ViewBuilder content: () -> Content
    ) {
        if let title = title {
            self.header = AppleSectionHeader(
                title: title,
                subtitle: subtitle,
                size: size,
                icon: icon,
                showSeeAll: showSeeAll,
                seeAllAction: seeAllAction
            )
        } else {
            self.header = nil
        }
        self.content = content()
        self.spacing = spacing
    }
    
    init(
        header: AppleSectionHeader?,
        spacing: CGFloat = AppSpacing.large,
        @ViewBuilder content: () -> Content
    ) {
        self.header = header
        self.content = content()
        self.spacing = spacing
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            if let header = header {
                header
                    .padding(.horizontal, AppSpacing.large)
            }
            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
