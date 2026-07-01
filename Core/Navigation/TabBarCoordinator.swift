import Observation
import SwiftUI

@Observable
public final class TabBarCoordinator {
    public var selectedTab: Int = 0
    public var tabScrollPositions: [Int: CGFloat] = [:]
    public var tabNavigationStacks: [Int: [AppRoute]] = [:]

    private var previousTab: Int = 0

    public init() {
        setupDefaultTabs()
    }

    private func setupDefaultTabs() {
        for index in 0..<5 {
            tabNavigationStacks[index] = []
            tabScrollPositions[index] = 0
        }
    }

    public func selectTab(_ index: Int) {
        previousTab = selectedTab
        selectedTab = index
    }

    public func updateScrollPosition(for tab: Int, offset: CGFloat) {
        tabScrollPositions[tab] = offset
    }

    public func getScrollPosition(for tab: Int) -> CGFloat {
        tabScrollPositions[tab] ?? 0
    }

    public func pushToTab(_ tab: Int, route: AppRoute) {
        if tabNavigationStacks[tab] == nil {
            tabNavigationStacks[tab] = []
        }
        tabNavigationStacks[tab]?.append(route)
    }

    public func popFromTab(_ tab: Int) {
        if tabNavigationStacks[tab]?.isEmpty == false {
            tabNavigationStacks[tab]?.removeLast()
        }
    }

    public func popToRootInTab(_ tab: Int) {
        tabNavigationStacks[tab] = []
    }

    public func getCurrentTabStack() -> [AppRoute]? {
        tabNavigationStacks[selectedTab]
    }

    public func restoreTabState(tab: Int) -> (stack: [AppRoute], scrollPosition: CGFloat) {
        let stack = tabNavigationStacks[tab] ?? []
        let position = tabScrollPositions[tab] ?? 0
        return (stack, position)
    }
}

public struct TabBarViewModifier: ViewModifier {
    @Environment(TabBarCoordinator.self) private var coordinator
    let onTabSelected: (Int) -> Void

    public func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content

            HStack(spacing: AppSpacing.none) {
                ForEach(0..<5, id: \.self) { index in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            coordinator.selectTab(index)
                            onTabSelected(index)
                        }
                    } label: {
                        VStack(spacing: AppSpacing.xSmall) {
                            Image(systemName: tabIcon(for: index))
                                .font(.title3)
                                .foregroundStyle(
                                    coordinator.selectedTab == index ? AppColors.tint : AppColors.textSecondary
                                )

                            Text(tabLabel(for: index))
                                .font(.caption2)
                                .foregroundStyle(
                                    coordinator.selectedTab == index ? AppColors.tint : AppColors.textSecondary
                                )
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                        }
                        .frame(maxWidth: .infinity)
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel("\(tabLabel(for: index)) tab")
                    .accessibilityHint("Opens the \(tabLabel(for: index)) screen")
                }
            }
            .padding(.vertical, AppSpacing.small)
            .background(AppColors.background.opacity(0.95))
            .overlay(
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, topTrailing: 20))
                    .stroke(AppColors.separator.opacity(0.2), lineWidth: 0.5)
            )
        }
    }

    private func tabIcon(for index: Int) -> String {
        switch index {
        case 0: return "house.fill"
        case 1: return "music.note"
        case 2: return "hands.praying.fill"
        case 3: return "person.fill"
        default: return "gear.fill"
        }
    }

    private func tabLabel(for index: Int) -> String {
        switch index {
        case 0: return "Home"
        case 1: return "Worship"
        case 2: return "Prayer"
        case 3: return "Community"
        default: return "Settings"
        }
    }
}

public extension View {
    func tabBarCoordinator(
        _ coordinator: TabBarCoordinator,
        onTabSelected: @escaping (Int) -> Void
    ) -> some View {
        environment(coordinator)
            .modifier(TabBarViewModifier(onTabSelected: onTabSelected))
    }
}
