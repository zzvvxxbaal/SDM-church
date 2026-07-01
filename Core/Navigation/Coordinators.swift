import SwiftUI

public struct NavigationContainer<Content: View>: View {
    @State private var coordinator = NavigationCoordinator()
    let content: (NavigationCoordinator) -> Content
    
    public init(@ViewBuilder content: @escaping (NavigationCoordinator) -> Content) {
        self.content = content
    }
    
    public var body: some View {
        NavigationStack(path: $coordinator.navigationStack) {
            content(coordinator)
        }
        .environment(coordinator)
    }
}

public struct TabCoordinator {
    @State private var tabSelection: Int = 0
    @State private var tabNavigationStacks: [Int: [AppRoute]] = [:]
    
    public init() {}
    
    public func selectTab(_ index: Int) {
        tabSelection = index
        if tabNavigationStacks[index] == nil {
            tabNavigationStacks[index] = []
        }
    }
    
    public func currentTabStack() -> [AppRoute] {
        tabNavigationStacks[tabSelection] ?? []
    }
    
    public func updateTabStack(_ routes: [AppRoute]) {
        tabNavigationStacks[tabSelection] = routes
    }
}

public struct StackCoordinator {
    private var navigationStack: [AppRoute] = []
    private var history: [AppRoute] = []
    
    public init() {}
    
    public mutating func push(_ route: AppRoute) {
        navigationStack.append(route)
        history.append(route)
    }
    
    public mutating func pop() -> AppRoute? {
        navigationStack.popLast()
    }
    
    public mutating func popToRoot() {
        navigationStack.removeAll()
    }
    
    public func current() -> AppRoute? {
        navigationStack.last
    }
    
    public func depth() -> Int {
        navigationStack.count
    }
    
    public func history() -> [AppRoute] {
        history
    }
}

public struct ModalCoordinator {
    private var modalStack: [(route: AppRoute, style: PresentationStyle)] = []
    private var animationState: NavigationCoordinator.AnimationState = .idle
    
    public init() {}
    
    public mutating func push(
        _ route: AppRoute,
        style: PresentationStyle = .sheet
    ) {
        animationState = .presenting
        modalStack.append((route, style))
    }
    
    public mutating func pop() -> (route: AppRoute, style: PresentationStyle)? {
        animationState = .dismissing
        return modalStack.popLast()
    }
    
    public mutating func popAll() {
        modalStack.removeAll()
        animationState = .idle
    }
    
    public func current() -> (route: AppRoute, style: PresentationStyle)? {
        modalStack.last
    }
    
    public func depth() -> Int {
        modalStack.count
    }
    
    public func getAnimationState() -> NavigationCoordinator.AnimationState {
        animationState
    }
}

public struct DeepLinkHandler: DeepLinkHandlerDelegate {
    private var coordinator: NavigationCoordinator
    
    public init(coordinator: NavigationCoordinator) {
        self.coordinator = coordinator
    }
    
    public func handle(deepLink: URL) -> Bool {
        if let deepLink = DeepLinkRoute(url: deepLink), let route = deepLink.route {
            coordinator.navigate(to: route)
            return true
        }
        return false
    }
    
    public func canHandle(deepLink: URL) -> Bool {
        DeepLinkRoute(url: deepLink) != nil
    }
}
