import Observation
import SwiftUI

@Observable
final class AppState {

    var isLoggedIn = true

    var userName = "정현석"
    
    var navigationCoordinator: NavigationCoordinator = NavigationCoordinator()
    var navigationManager: NavigationManager?
    var appRouter: AppRouter = AppRouter()
    var tabBarCoordinator: TabBarCoordinator = TabBarCoordinator()
    
    init() {
        navigationManager = NavigationManager(coordinator: navigationCoordinator)
        setupNavigation()
    }
    
    private func setupNavigation() {
        appRouter.navigationCoordinator = navigationCoordinator
    }

}