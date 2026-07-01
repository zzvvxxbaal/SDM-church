import SwiftUI

public final class NavigationBarAppearanceManager: NSObject, ObservableObject {
    @Published var scrollOffset: CGFloat = 0
    @Published var isLargeTitleCollapsed: Bool = false
    @Published var backgroundColor: Color = .clear
    @Published var backgroundOpacity: Double = 0

    private let collapsureThreshold: CGFloat = 50
    private let largeTitleHeight: CGFloat = 52

    override public init() {
        super.init()
    }

    public func updateScrollOffset(_ offset: CGFloat) {
        scrollOffset = offset
        updateLargeTitleState()
        updateBackgroundAppearance()
    }

    private func updateLargeTitleState() {
        withAnimation(.easeInOut(duration: 0.2)) {
            isLargeTitleCollapsed = scrollOffset > collapsureThreshold
        }
    }

    private func updateBackgroundAppearance() {
        let opacity = min(1.0, scrollOffset / largeTitleHeight)
        backgroundOpacity = opacity

        if opacity > 0.5 {
            backgroundColor = AppColors.background
        } else {
            backgroundColor = .clear
        }
    }

    public func reset() {
        withAnimation {
            scrollOffset = 0
            isLargeTitleCollapsed = false
            backgroundColor = .clear
            backgroundOpacity = 0
        }
    }
}

public struct LargeTitleSynchronizer: ViewModifier {
    @ObservedObject var appearanceManager: NavigationBarAppearanceManager

    public func body(content: Content) -> some View {
        ScrollViewReader { _ in
            content
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { offset in
                    appearanceManager.updateScrollOffset(offset)
                }
        }
    }
}

public struct ScrollOffsetPreferenceKey: PreferenceKey {
    public static var defaultValue: CGFloat = 0

    public static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

public struct ScrollOffsetTracker: View {
    let onOffsetChange: (CGFloat) -> Void

    public var body: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(
                    key: ScrollOffsetPreferenceKey.self,
                    value: geometry.frame(in: .named("scroll")).minY
                )
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { offset in
            onOffsetChange(offset)
        }
    }
}

public struct NavigationBarBackground: View {
    @ObservedObject var appearanceManager: NavigationBarAppearanceManager

    public var body: some View {
        ZStack {
            appearanceManager.backgroundColor
                .opacity(appearanceManager.backgroundOpacity)

            LinearGradient(
                gradient: Gradient(colors: [
                    Color.clear,
                    Color.black.opacity(0.02)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .opacity(appearanceManager.backgroundOpacity)
        }
        .ignoresSafeArea(edges: .top)
    }
}

public struct LiquidGlassNavigationBackground: View {
    @ObservedObject var appearanceManager: NavigationBarAppearanceManager

    public var body: some View {
        ZStack {
            GlassBackgroundView()
                .opacity(appearanceManager.backgroundOpacity)

            LinearGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(0.1),
                    Color.black.opacity(0.05)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .opacity(appearanceManager.backgroundOpacity)
        }
        .ignoresSafeArea(edges: .top)
    }
}

public struct LargeTitleView: View {
    let title: String
    let subtitle: String
    @ObservedObject var appearanceManager: NavigationBarAppearanceManager

    public var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.xSmall) {
            Text(title)
                .font(.largeTitle.weight(.bold))
                .lineLimit(2)
                .minimumScaleFactor(0.75)
                .scaleEffect(
                    appearanceManager.isLargeTitleCollapsed ? 0.8 : 1.0,
                    anchor: .leading
                )
                .offset(y: appearanceManager.isLargeTitleCollapsed ? AppSpacing.small : 0)
                .accessibilityAddTraits(.isHeader)

            Text(subtitle)
                .font(.subheadline)
                .foregroundStyle(AppColors.textSecondary)
                .lineLimit(2)
                .minimumScaleFactor(0.85)
                .opacity(appearanceManager.isLargeTitleCollapsed ? 0 : 1)
        }
        .animation(.easeInOut(duration: 0.2), value: appearanceManager.isLargeTitleCollapsed)
    }
}

public extension View {
    func largeTitleSynchronizer(
        _ appearanceManager: NavigationBarAppearanceManager
    ) -> some View {
        modifier(LargeTitleSynchronizer(appearanceManager: appearanceManager))
    }
}

private struct GlassBackgroundView: View {
    var body: some View {
        ZStack {
            Color.white.opacity(0.2)

            LinearGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(0.3),
                    Color.white.opacity(0.1)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
        .blur(radius: 20)
        .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}
