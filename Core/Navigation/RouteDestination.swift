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
            EmptyView()
        case .worship:
            EmptyView()
        case .prayer:
            EmptyView()
        case .notice:
            EmptyView()
        case .calendar:
            EmptyView()
        case .community:
            EmptyView()
        case .profile:
            EmptyView()
        case .settings:
            EmptyView()
        case .authentication:
            EmptyView()
        }
    }
}
