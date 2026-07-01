import Observation
import SwiftUI

@Observable
final class AppRouter {

    enum Tab {

        case home
        case worship
        case prayer
        case community
        case settings
        
        var index: Int {
            switch self {
            case .home: return 0
            case .worship: return 1
            case .prayer: return 2
            case .community: return 3
            case .settings: return 4
            }
        }

    }

    var selectedTab: Tab = .home
    var navigationCoordinator: NavigationCoordinator?
    
    init(navigationCoordinator: NavigationCoordinator? = nil) {
        self.navigationCoordinator = navigationCoordinator
    }
    
    func selectTab(_ tab: Tab) {
        selectedTab = tab
        navigationCoordinator?.selectTab(tab.index)
    }
    
    func navigate(to route: AppRoute) {
        navigationCoordinator?.navigate(to: route)
    }
    
    func goBack() {
        navigationCoordinator?.pop()
    }

}