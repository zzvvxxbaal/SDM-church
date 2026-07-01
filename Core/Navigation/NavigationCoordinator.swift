import SwiftUI
import Observation

enum AppRoute: Hashable {
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

@Observable
final class NavigationCoordinator {
    
    var navigationStack: [AppRoute] = []
    var selectedTab: Int = 0
    var isPresented: Bool = false
    var presentedSheet: AppRoute?
    
    func navigate(to route: AppRoute) {
        navigationStack.append(route)
    }
    
    func pop() {
        if !navigationStack.isEmpty {
            navigationStack.removeLast()
        }
    }
    
    func popToRoot() {
        navigationStack.removeAll()
    }
    
    func selectTab(_ index: Int) {
        selectedTab = index
    }
    
    func presentSheet(_ route: AppRoute) {
        presentedSheet = route
        isPresented = true
    }
    
    func dismissSheet() {
        presentedSheet = nil
        isPresented = false
    }
    
}
