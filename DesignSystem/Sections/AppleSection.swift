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
                                .font(size.iconFont)
                                .foregroundStyle(AppColors.tint)
                                .accessibilityHidden(true)
                        }

                        Text(title)
                            .font(size.titleFont)
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)
                            .accessibilityAddTraits(.isHeader)
                    }

                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(size.subtitleFont)
                            .foregroundStyle(AppColors.textSecondary)
                            .lineLimit(2)
                            .minimumScaleFactor(0.85)
                    }
                }

                Spacer(minLength: AppSpacing.medium)

                if showSeeAll {
                    Button(action: { seeAllAction?() }) {
                        HStack(spacing: AppSpacing.xSmall) {
                            Text("모두보기")
                                .font(.caption.weight(.semibold))
                            Image(systemName: "chevron.right")
                                .font(.caption.weight(.semibold))
                                .accessibilityHidden(true)
                        }
                        .foregroundStyle(AppColors.tint)
                    }
                    .accessibilityLabel("모두보기")
                    .accessibilityHint("이 섹션의 전체 내용을 엽니다")
                    .accessibilityAddTraits(.isButton)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .accessibilityElement(children: .combine)
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
            header = AppleSectionHeader(
                title: title,
                subtitle: subtitle,
                size: size,
                icon: icon,
                showSeeAll: showSeeAll,
                seeAllAction: seeAllAction
            )
        } else {
            header = nil
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
            if let header {
                header
                    .padding(.horizontal, AppSpacing.large)
            }
            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
