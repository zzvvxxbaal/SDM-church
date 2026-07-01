import SwiftUI

// MARK: - Responsive Grid Layout

struct ResponsiveGrid<Item: Identifiable, Content: View>: View {
    let items: [Item]
    let columns: Int
    let spacing: CGFloat
    let content: (Item) -> Content
    
    init(
        items: [Item],
        columns: Int = 2,
        spacing: CGFloat = AppSpacing.medium,
        @ViewBuilder content: @escaping (Item) -> Content
    ) {
        self.items = items
        self.columns = columns
        self.spacing = spacing
        self.content = content
    }
    
    var body: some View {
        let grid = Array(stride(from: 0, to: items.count, by: columns))
            .map { index in
                Array(items[index..<min(index + columns, items.count)])
            }
        
        VStack(spacing: spacing) {
            ForEach(Array(grid.enumerated()), id: \.offset) { _, row in
                HStack(spacing: spacing) {
                    ForEach(row) { item in
                        content(item)
                            .frame(maxWidth: .infinity)
                    }
                    
                    ForEach(0..<(columns - row.count), id: \.self) { _ in
                        Spacer()
                            .frame(maxWidth: .infinity)
                    }
                }
            }
        }
    }
}

// MARK: - Adaptive Text Size

struct AdaptiveText: View {
    let text: String
    let weight: Font.Weight
    let fontSize: CGFloat
    let color: Color
    let lineLimit: Int?
    
    @Environment(\.sizeCategory) var sizeCategory
    
    var scaledSize: CGFloat {
        let multiplier: CGFloat
        switch sizeCategory {
        case .extraSmall:
            multiplier = 0.8
        case .small:
            multiplier = 0.9
        case .medium:
            multiplier = 1.0
        case .large:
            multiplier = 1.1
        case .extraLarge:
            multiplier = 1.2
        case .extraExtraLarge:
            multiplier = 1.35
        case .extraExtraExtraLarge:
            multiplier = 1.5
        case .accessibility:
            multiplier = 1.7
        @unknown default:
            multiplier = 1.0
        }
        return fontSize * multiplier
    }
    
    private var adaptiveFont: Font {
        switch scaledSize {
        case ..<12:
            return AppFonts.caption2
        case ..<14:
            return AppFonts.caption1
        case ..<16:
            return AppFonts.subheadline
        case ..<18:
            return AppFonts.body
        case ..<22:
            return AppFonts.headline
        case ..<28:
            return AppFonts.title3
        default:
            return AppFonts.title2
        }
    }

    var body: some View {
        Text(text)
            .font(adaptiveFont.weight(weight))
            .foregroundStyle(color)
            .lineLimit(lineLimit)
            .minimumScaleFactor(0.8)
    }
}

// MARK: - Adaptive Spacing

struct AdaptiveSpacing {
    @Environment(\.sizeCategory) var sizeCategory
    
    func scale(_ baseSize: CGFloat) -> CGFloat {
        let multiplier: CGFloat
        switch sizeCategory {
        case .extraSmall:
            multiplier = 0.85
        case .small:
            multiplier = 0.9
        case .medium:
            multiplier = 1.0
        case .large:
            multiplier = 1.1
        case .extraLarge:
            multiplier = 1.2
        case .extraExtraLarge:
            multiplier = 1.35
        case .extraExtraExtraLarge:
            multiplier = 1.5
        case .accessibility:
            multiplier = 1.8
        @unknown default:
            multiplier = 1.0
        }
        return baseSize * multiplier
    }
}

// MARK: - Safe Area Aware Container

struct SafeAreaAwareContainer<Content: View>: View {
    @ViewBuilder
    let content: Content
    
    let horizontalPadding: CGFloat
    let verticalPadding: CGFloat
    
    init(
        horizontalPadding: CGFloat = AppSpacing.large,
        verticalPadding: CGFloat = AppSpacing.large,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
    }
    
    var body: some View {
        VStack {
            content
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.vertical, verticalPadding)
        .ignoresSafeArea(edges: [])
    }
}

// MARK: - Attention Animation

struct AttentionAnimation: ViewModifier {
    @State private var isAnimating = false
    
    let scale: CGFloat
    let duration: Double
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isAnimating ? scale : 1.0)
            .animation(
                Animation.easeInOut(duration: duration)
                    .repeatForever(autoreverses: true),
                value: isAnimating
            )
            .onAppear {
                isAnimating = true
            }
    }
}

extension View {
    func attentionAnimation(scale: CGFloat = 1.05, duration: Double = 1.5) -> some View {
        modifier(AttentionAnimation(scale: scale, duration: duration))
    }
}

// MARK: - Corner Radius with Animation

struct AnimatedCornerRadius: View {
    let radius: CGFloat
    let isAnimating: Bool
    
    @State private var currentRadius: CGFloat = 0
    
    var body: some View {
        RoundedRectangle(cornerRadius: currentRadius)
            .onAppear {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    currentRadius = radius
                }
            }
            .onChange(of: isAnimating) { _, newValue in
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    currentRadius = newValue ? 0 : radius
                }
            }
    }
}

// MARK: - Accessibility Helper

struct AccessibleLabel<Content: View>: View {
    let label: String
    let hint: String?
    @ViewBuilder
    let content: () -> Content
    
    var body: some View {
        content()
            .accessibilityLabel(label)
            .accessibilityHint(hint ?? "")
    }
}

// MARK: - Motion Reduce Aware Animation

struct MotionReduceAnimation<Value: VectorArithmetic>: ViewModifier {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    let animation: Animation
    let value: Value
    
    func body(content: Content) -> some View {
        if reduceMotion {
            content
                .animation(.linear(duration: 0.01), value: value)
        } else {
            content
                .animation(animation, value: value)
        }
    }
}

extension View {
    func motionReduceAnimation<Value: VectorArithmetic>(
        _ animation: Animation,
        value: Value
    ) -> some View {
        modifier(MotionReduceAnimation(animation: animation, value: value))
    }
}

// MARK: - Section Divider with Style

struct SectionDivider: View {
    let style: DividerStyle
    
    enum DividerStyle {
        case subtle
        case prominent
        case invisible
    }
    
    var color: Color {
        switch style {
        case .subtle:
            return AppColors.separator.opacity(0.2)
        case .prominent:
            return AppColors.separator.opacity(0.5)
        case .invisible:
            return Color.clear
        }
    }
    
    var height: CGFloat {
        switch style {
        case .subtle:
            return 0.5
        case .prominent:
            return 1.0
        case .invisible:
            return 8
        }
    }
    
    var body: some View {
        VStack {
            Divider()
                .frame(height: height)
                .foregroundStyle(color)
        }
        .frame(height: height + AppSpacing.medium)
    }
}
