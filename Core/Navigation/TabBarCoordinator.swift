import SwiftUI

public final class TabBarCoordinator: NSObject, ObservableObject {
    @Published var selectedTab: Int = 0
    @Published var tabScrollPositions: [Int: CGFloat] = [:]
    @Published var tabNavigationStacks: [Int: [AppRoute]] = [:]
    
    private var previousTab: Int = 0
    
    override public init() {
        super.init()
        setupDefaultTabs()
    }
    
    private func setupDefaultTabs() {
        for i in 0..<5 {
            tabNavigationStacks[i] = []
            tabScrollPositions[i] = 0
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
    @ObservedObject var coordinator: TabBarCoordinator
    let onTabSelected: (Int) -> Void
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
            
            HStack(spacing: 0) {
                ForEach(0..<5, id: \.self) { index in
                    VStack(spacing: 4) {
                        Image(systemName: getTabIcon(for: index))
                            .font(.system(size: 24))
                            .foregroundColor(
                                coordinator.selectedTab == index ?
                                AppColors.tint : .gray
                            )
                        
                        Text(getTabLabel(for: index))
                            .font(.caption2)
                            .foregroundColor(
                                coordinator.selectedTab == index ?
                                AppColors.tint : .gray
                            )
                    }
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            coordinator.selectTab(index)
                            onTabSelected(index)
                        }
                    }
                }
            }
            .padding(.vertical, 8)
            .background(Color(.systemBackground).opacity(0.95))
            .overlay(
                UnevenRoundedRectangle(
                    cornerRadii: .init(topLeading: 20, topTrailing: 20)
                )
                .stroke(Color.gray.opacity(0.2), lineWidth: 0.5)
            )
        }
    }
    
    private func getTabIcon(for index: Int) -> String {
        switch index {
        case 0: return "house.fill"
        case 1: return "music.note"
        case 2: return "hands.praying.fill"
        case 3: return "person.fill"
        default: return "gear.fill"
        }
    }
    
    private func getTabLabel(for index: Int) -> String {
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
        modifier(TabBarViewModifier(coordinator: coordinator, onTabSelected: onTabSelected))
    }
}
