import SwiftUI
import Observation

@Observable
final class NavigationManager {

    enum Destination: Hashable {

        case home
        case notice
        case worship
        case prayer
        case calendar
        case community
        case profile
        case settings

    }

    var path = NavigationPath()

    func push(_ destination: Destination) {

        path.append(destination)

    }

    func pop() {

        guard !path.isEmpty else { return }

        path.removeLast()

    }

    func popToRoot() {

        path = NavigationPath()

    }

}