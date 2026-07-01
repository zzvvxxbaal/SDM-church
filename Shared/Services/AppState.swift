import Observation
import SwiftUI

@Observable
final class AppState {

    var isLoggedIn = true
    var userName = "정현석"
    var notificationsEnabled = true
    var isDarkModeEnabled = false

    let navigationCoordinator = NavigationCoordinator()
    let navigationManager: NavigationManager
    let appRouter: AppRouter
    let tabBarCoordinator = TabBarCoordinator()

    var preferredColorScheme: ColorScheme {
        isDarkModeEnabled ? .dark : .light
    }
    
    init() {
        navigationManager = NavigationManager(coordinator: navigationCoordinator)
        appRouter = AppRouter(navigationCoordinator: navigationCoordinator)
    }
}