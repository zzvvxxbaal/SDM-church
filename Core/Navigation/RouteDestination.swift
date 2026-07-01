import SwiftUI

public struct RouteDestination {
    let id: UUID
    let tag: Int
    var isPresented: Bool
    
    public init(id: UUID, tag: Int, isPresented: Bool = false) {
        self.id = id
        self.tag = tag
        self.isPresented = isPresented
    }
}

public extension NavigationPath {
    mutating func append<R: RouteType>(_ route: R) {
        append(route)
    }
    
    mutating func removeLast<R: RouteType>(_ type: R.Type) {
        if !isEmpty {
            removeLast()
        }
    }
}

public protocol NavigationStackResolver {
    associatedtype Route: Hashable
    
    @ViewBuilder
    func resolve(_ route: Route) -> some View
}

public struct DefaultNavigationStackResolver: NavigationStackResolver {
    public typealias Route = AppRoute
    
    @ViewBuilder
    public func resolve(_ route: AppRoute) -> some View {
        switch route {
        case .home:
            HomeView()
        case .worship:
            WorshipView()
        case .prayer:
            PrayerView()
        case .notice:
            NoticeView()
        case .calendar:
            CalendarView()
        case .community:
            CommunityView()
        case .profile:
            ProfileView()
        case .settings:
            SettingsView()
        case .authentication:
            LoginView()
        }
    }
}
