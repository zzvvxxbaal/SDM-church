import SwiftUI
import Observation

@Observable
final class NavigationManager {

    enum Destination: Hashable, Codable {

        case home
        case notice
        case worship
        case prayer
        case calendar
        case community
        case profile
        case settings

        var appRoute: AppRoute {
            switch self {
            case .home: return .home
            case .notice: return .notice
            case .worship: return .worship
            case .prayer: return .prayer
            case .calendar: return .calendar
            case .community: return .community
            case .profile: return .profile
            case .settings: return .settings
            }
        }

    }

    var path = NavigationPath()
    private(set) var currentDestination: Destination?
    private var coordinator: NavigationCoordinator
    
    init(coordinator: NavigationCoordinator? = nil) {
        self.coordinator = coordinator ?? NavigationCoordinator()
    }

    func push(_ destination: Destination) {
        path.append(destination)
        currentDestination = destination
        coordinator.navigate(to: destination.appRoute)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
        coordinator.pop()
    }

    func popToRoot() {
        path = NavigationPath()
        coordinator.popToRoot()
    }
    
    func presentSheet(_ destination: Destination) {
        coordinator.presentSheet(destination.appRoute, style: .sheet)
    }
    
    func dismissSheet() {
        coordinator.dismissSheet()
    }

}