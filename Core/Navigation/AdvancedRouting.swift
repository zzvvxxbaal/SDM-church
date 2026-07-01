import Foundation
import SwiftUI

public struct DeepLinkRouter {
    private let coordinator: NavigationCoordinator
    
    public init(coordinator: NavigationCoordinator) {
        self.coordinator = coordinator
    }
    
    public func handleIncomingURL(_ url: URL) -> Bool {
        guard let deepLink = DeepLinkRoute(url: url) else { return false }
        
        if let route = deepLink.route {
            coordinator.navigate(to: route)
            return true
        }
        return false
    }
    
    public func buildDeepLink(for route: AppRoute) -> URL? {
        let urlString = "sdmchurch://app\(route.path)"
        return URL(string: urlString)
    }
}

public extension AppRoute {
    var path: String {
        switch self {
        case .home: return "/home"
        case .worship: return "/worship"
        case .prayer: return "/prayer"
        case .notice: return "/notice"
        case .calendar: return "/calendar"
        case .community: return "/community"
        case .profile: return "/profile"
        case .settings: return "/settings"
        case .authentication: return "/auth"
        }
    }
}

public struct WidgetRouteHandler {
    public static func canHandle(widgetID: String) -> Bool {
        WidgetRegistry.shared.isRegistered(id: widgetID)
    }
    
    public static func resolve(widgetID: String) -> AppRoute? {
        WidgetRegistry.shared.route(for: widgetID)
    }
}

public final class WidgetRegistry {
    public static let shared = WidgetRegistry()
    
    private var routes: [String: AppRoute] = [:]
    
    private init() {}
    
    public func register(id: String, route: AppRoute) {
        routes[id] = route
    }
    
    public func isRegistered(id: String) -> Bool {
        routes[id] != nil
    }
    
    public func route(for id: String) -> AppRoute? {
        routes[id]
    }
}

public struct LiveActivityRouteHandler {
    public static func canHandle(activityID: String) -> Bool {
        LiveActivityRegistry.shared.isRegistered(id: activityID)
    }
    
    public static func resolve(activityID: String) -> AppRoute? {
        LiveActivityRegistry.shared.route(for: activityID)
    }
}

public final class LiveActivityRegistry {
    public static let shared = LiveActivityRegistry()
    
    private var routes: [String: AppRoute] = [:]
    
    private init() {}
    
    public func register(id: String, route: AppRoute) {
        routes[id] = route
    }
    
    public func isRegistered(id: String) -> Bool {
        routes[id] != nil
    }
    
    public func route(for id: String) -> AppRoute? {
        routes[id]
    }
}

public struct SiriShortcutHandler {
    let coordinator: NavigationCoordinator
    
    public init(coordinator: NavigationCoordinator) {
        self.coordinator = coordinator
    }
    
    public func handle(intent: String, parameters: [String: Any]? = nil) -> Bool {
        let components = intent.split(separator: ".").map(String.init)
        
        switch components.joined(separator: ".") {
        case "siri.prayer":
            coordinator.navigate(to: .prayer)
            return true
        case "siri.worship":
            coordinator.navigate(to: .worship)
            return true
        case "siri.community":
            coordinator.navigate(to: .community)
            return true
        default:
            return false
        }
    }
}

public struct NotificationRouteHandler {
    let coordinator: NavigationCoordinator
    
    public init(coordinator: NavigationCoordinator) {
        self.coordinator = coordinator
    }
    
    public func handle(notification: [AnyHashable: Any]) -> Bool {
        guard let actionID = notification["action"] as? String else { return false }
        
        switch actionID {
        case "notice.opened":
            if let noticeID = notification["noticeId"] as? String {
                coordinator.navigate(to: .notice)
                return true
            }
        case "prayer.request":
            coordinator.navigate(to: .prayer)
            return true
        case "worship.reminder":
            coordinator.navigate(to: .worship)
            return true
        default:
            return false
        }
        
        return false
    }
}

public struct UniversalLinkHandler: DeepLinkHandlerDelegate {
    let coordinator: NavigationCoordinator
    
    public init(coordinator: NavigationCoordinator) {
        self.coordinator = coordinator
    }
    
    public func handle(deepLink: URL) -> Bool {
        let router = DeepLinkRouter(coordinator: coordinator)
        return router.handleIncomingURL(deepLink)
    }
    
    public func canHandle(deepLink: URL) -> Bool {
        guard let components = URLComponents(url: deepLink, resolvingAgainstBaseURL: false) else {
            return false
        }
        
        return (components.scheme == "https" || components.scheme == "sdmchurch") &&
               components.host?.contains("app") == true
    }
}
