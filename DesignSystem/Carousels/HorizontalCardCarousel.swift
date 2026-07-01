import SwiftUI

struct HorizontalCardCarousel<Item: Identifiable, Content: View>: View {
    let items: [Item]
    let content: (Item) -> Content
    let itemSpacing: CGFloat
    let horizontalPadding: CGFloat
    let itemWidth: CGFloat?
    let showPeek: Bool
    
    @State private var scrollOffset: CGFloat = 0
    
    init(
        items: [Item],
        itemSpacing: CGFloat = AppSpacing.medium,
        horizontalPadding: CGFloat = AppSpacing.large,
        itemWidth: CGFloat? = nil,
        showPeek: Bool = true,
        @ViewBuilder content: @escaping (Item) -> Content
    ) {
        self.items = items
        self.itemSpacing = itemSpacing
        self.horizontalPadding = horizontalPadding
        self.itemWidth = itemWidth
        self.showPeek = showPeek
        self.content = content
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: itemSpacing) {
                ForEach(items) { item in
                    content(item)
                        .frame(width: itemWidth, alignment: .leading)
                        .scrollTransition { effect, phase in
                            effect
                                .scaleEffect(phase.isIdentity ? 1.0 : 0.95, anchor: .center)
                                .opacity(phase.isIdentity ? 1.0 : 0.8)
                        }
                }
            }
            .padding(.horizontal, horizontalPadding)
        }
        .scrollClipDisabled()
        .contentMargins(
            .horizontal,
            0,
            for: .scrollContent
        )
    }
}

// Variant with automatic width calculation
struct ResponsiveHorizontalCarousel<Item: Identifiable, Content: View>: View {
    let items: [Item]
    let content: (Item) -> Content
    let itemSpacing: CGFloat
    let horizontalPadding: CGFloat
    let itemsPerView: CGFloat
    
    init(
        items: [Item],
        itemSpacing: CGFloat = AppSpacing.medium,
        horizontalPadding: CGFloat = AppSpacing.large,
        itemsPerView: CGFloat = 1.5,
        @ViewBuilder content: @escaping (Item) -> Content
    ) {
        self.items = items
        self.itemSpacing = itemSpacing
        self.horizontalPadding = horizontalPadding
        self.itemsPerView = itemsPerView
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            let availableWidth = geometry.size.width - (horizontalPadding * 2)
            let itemWidth = (availableWidth - (itemSpacing * (itemsPerView - 1))) / itemsPerView
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: itemSpacing) {
                    ForEach(items) { item in
                        content(item)
                            .frame(width: itemWidth)
                            .scrollTransition { effect, phase in
                                effect
                                    .scaleEffect(phase.isIdentity ? 1.0 : 0.95, anchor: .center)
                                    .opacity(phase.isIdentity ? 1.0 : 0.8)
                            }
                    }
                }
                .padding(.horizontal, horizontalPadding)
            }
            .scrollClipDisabled()
            .contentMargins(.horizontal, 0, for: .scrollContent)
        }
        .frame(height: 300)
    }
}

// Carousel with indicators
struct CarouselWithIndicators<Item: Identifiable, Content: View>: View {
    let items: [Item]
    let content: (Item) -> Content
    let itemSpacing: CGFloat
    let horizontalPadding: CGFloat
    let itemWidth: CGFloat?
    
    @State private var currentIndex: Int = 0
    @Namespace private var namespace
    
    init(
        items: [Item],
        itemSpacing: CGFloat = AppSpacing.medium,
        horizontalPadding: CGFloat = AppSpacing.large,
        itemWidth: CGFloat? = nil,
        @ViewBuilder content: @escaping (Item) -> Content
    ) {
        self.items = items
        self.itemSpacing = itemSpacing
        self.horizontalPadding = horizontalPadding
        self.itemWidth = itemWidth
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: AppSpacing.medium) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: itemSpacing) {
                    ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                        content(item)
                            .frame(width: itemWidth, alignment: .leading)
                            .scrollTransition { effect, phase in
                                effect
                                    .scaleEffect(phase.isIdentity ? 1.0 : 0.95, anchor: .center)
                                    .opacity(phase.isIdentity ? 1.0 : 0.8)
                            }
                    }
                }
                .padding(.horizontal, horizontalPadding)
            }
            .scrollClipDisabled()
            .contentMargins(.horizontal, 0, for: .scrollContent)
            
            // Indicators
            if items.count > 1 {
                HStack(spacing: AppSpacing.xSmall) {
                    ForEach(0..<items.count, id: \.self) { index in
                        Capsule()
                            .fill(index == currentIndex ? AppColors.tint : Color.gray.opacity(0.3))
                            .frame(width: index == currentIndex ? 24 : 8, height: 4)
                            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: currentIndex)
                            .matchedGeometryEffect(id: "indicator-\(index)", in: namespace)
                    }
                    Spacer()
                }
                .padding(.horizontal, horizontalPadding)
            }
        }
    }
}
