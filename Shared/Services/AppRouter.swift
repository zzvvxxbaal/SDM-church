import Observation

@Observable
final class AppRouter {

    enum Tab {

        case home
        case worship
        case prayer
        case community
        case settings

    }

    var selectedTab: Tab = .home

}