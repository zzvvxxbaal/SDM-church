import SwiftUI

struct AppleHeroCard<Content: View>: View {
    @ViewBuilder
    let content: Content
    
    let backgroundColor: Color
    let cornerRadius: CGFloat
    
    init(
        backgroundColor: Color = .blue,
        cornerRadius: CGFloat = AppRadius.card,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    backgroundColor.opacity(0.8),
                    backgroundColor.opacity(0.4)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            content
                .padding(AppSpacing.large)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 280)
        .liquidGlass(.card, cornerRadius: cornerRadius)
    }
}

struct AppleFeaturedCard<Content: View>: View {
    @ViewBuilder
    let content: Content
    
    let title: String?
    let subtitle: String?
    let icon: String?
    let backgroundColor: Color
    
    init(
        title: String? = nil,
        subtitle: String? = nil,
        icon: String? = nil,
        backgroundColor: Color = .clear,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            if let icon = icon {
                HStack(spacing: AppSpacing.small) {
                    Image(systemName: icon)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(AppColors.tint)
                    
                    if let title = title {
                        Text(title)
                            .font(.system(size: 16, weight: .semibold))
                    }
                }
            } else if let title = title {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
            }
            
            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundStyle(.secondary)
            }
            
            content
        }
        .padding(AppSpacing.large)
        .frame(maxWidth: .infinity, alignment: .leading)
        .liquidGlass(.card, cornerRadius: AppRadius.card)
    }
}

struct AppleExpandableCard<Content: View>: View {
    @State private var isExpanded = false
    
    @ViewBuilder
    let content: Content
    
    @ViewBuilder
    let expandedContent: Content
    
    let title: String
    let subtitle: String?
    let icon: String?
    
    init(
        title: String,
        subtitle: String? = nil,
        icon: String? = nil,
        @ViewBuilder content: () -> Content,
        @ViewBuilder expandedContent: () -> Content
    ) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.content = content()
        self.expandedContent = expandedContent()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            HStack(spacing: AppSpacing.small) {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(AppColors.tint)
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                    
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(.system(size: 13, weight: .regular))
                            .foregroundStyle(.secondary)
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.secondary)
                    .rotationEffect(.degrees(isExpanded ? 180 : 0))
                    .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isExpanded)
            }
            
            if !isExpanded {
                content
            } else {
                VStack(alignment: .leading, spacing: AppSpacing.medium) {
                    Divider()
                        .padding(.vertical, AppSpacing.small)
                    
                    expandedContent
                }
            }
        }
        .padding(AppSpacing.large)
        .frame(maxWidth: .infinity, alignment: .leading)
        .liquidGlass(.card, cornerRadius: AppRadius.card)
        .cardExpand(isExpanded: isExpanded, scale: 1.02)
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                isExpanded.toggle()
            }
        }
    }
}

struct AppleCardCarouselItem<Content: View>: View {
    @ViewBuilder
    let content: Content
    
    let isVisible: Bool
    
    var body: some View {
        content
            .opacity(isVisible ? 1.0 : 0.5)
            .scaleEffect(isVisible ? 1.0 : 0.95)
    }
}
