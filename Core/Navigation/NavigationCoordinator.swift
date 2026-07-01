import SwiftUI
import Observation

enum AppRoute: Hashable, Codable {
    case home
    case worship
    case prayer
    case notice
    case calendar
    case community
    case profile
    case settings
    case authentication
}

enum PresentationStyle: Hashable {
    case sheet
    case fullScreenCover
    case dialog
    case alert
    case confirmationDialog
    case bottomSheet
}

enum NavigationTransition: Hashable {
    case push
    case modal
    case sheet
    case custom(String)
}

@Observable
final class NavigationCoordinator: DeepLinkHandlerDelegate {
    
    var navigationStack: [AppRoute] = []
    var selectedTab: Int = 0
    var isPresented: Bool = false
    var presentedSheet: AppRoute?
    
    private(set) var navigationHistory: [AppRoute] = []
    private(set) var modalStack: [(route: AppRoute, style: PresentationStyle)] = []
    private(set) var currentTransition: NavigationTransition = .push
    private(set) var animationState: AnimationState = .idle
    private var deepLinkQueue: [URL] = []
    
    enum AnimationState: Hashable {
        case idle
        case presenting
        case dismissing
        case transitioning
    }
    
    init() {
        DeepLinkHandler.shared.register(self)
    }
    
    deinit {
        DeepLinkHandler.shared.unregister(self)
    }
    
    func navigate(to route: AppRoute, transition: NavigationTransition = .push) {
        navigationStack.append(route)
        navigationHistory.append(route)
        currentTransition = transition
    }
    
    func pop(animated: Bool = true) {
        if !navigationStack.isEmpty {
            navigationStack.removeLast()
            currentTransition = animated ? .push : .custom("instant")
        }
    }
    
    func popToRoot(animated: Bool = true) {
        navigationStack.removeAll()
        navigationHistory.removeAll()
        currentTransition = animated ? .push : .custom("instant")
    }
    
    func selectTab(_ index: Int) {
        selectedTab = index
    }
    
    func presentSheet(_ route: AppRoute, style: PresentationStyle = .sheet) {
        animationState = .presenting
        presentedSheet = route
        isPresented = true
        modalStack.append((route, style))
    }
    
    func dismissSheet(animated: Bool = true) {
        animationState = .dismissing
        presentedSheet = nil
        isPresented = false
        if !modalStack.isEmpty {
            modalStack.removeLast()
        }
        if animated {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.animationState = .idle
            }
        } else {
            animationState = .idle
        }
    }
    
    func pushModal(_ route: AppRoute, style: PresentationStyle = .sheet) {
        presentSheet(route, style: style)
    }
    
    func popModal() {
        dismissSheet()
    }
    
    func popAllModals() {
        modalStack.removeAll()
        presentedSheet = nil
        isPresented = false
        animationState = .idle
    }
    
    func getBreadcrumb() -> [AppRoute] {
        navigationHistory
    }
    
    func canGoBack() -> Bool {
        !navigationStack.isEmpty
    }
    
    func isModalPresented() -> Bool {
        isPresented && presentedSheet != nil
    }
    
    func hasModalStack() -> Bool {
        !modalStack.isEmpty
    }
    
    public func handle(deepLink: URL) -> Bool {
        deepLinkQueue.append(deepLink)
        processDeepLinkQueue()
        return true
    }
    
    public func canHandle(deepLink: URL) -> Bool {
        DeepLinkRoute(url: deepLink) != nil
    }
    
    private func processDeepLinkQueue() {
        guard !deepLinkQueue.isEmpty else { return }
        
        while !deepLinkQueue.isEmpty {
            let url = deepLinkQueue.removeFirst()
            if let deepLink = DeepLinkRoute(url: url), let route = deepLink.route {
                navigate(to: route)
            }
        }
    }
    
}
