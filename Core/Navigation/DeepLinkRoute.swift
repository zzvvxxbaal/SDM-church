import Foundation
import SwiftUI

public struct DeepLinkRoute {
    public let scheme: String
    public let host: String
    public let path: String
    public let parameters: [String: String]
    
    public init?(url: URL) {
        guard let scheme = url.scheme, let host = url.host else { return nil }
        
        self.scheme = scheme
        self.host = host
        self.path = url.path
        
        var params: [String: String] = [:]
        if let components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
            components.queryItems?.forEach { item in
                params[item.name] = item.value
            }
        }
        self.parameters = params
    }
    
    public var route: AppRoute? {
        switch (host, path.lowercased()) {
        case ("app", "/home"):
            return .home
        case ("app", "/worship"):
            return .worship
        case ("app", "/prayer"):
            return .prayer
        case ("app", "/notice"):
            return .notice
        case ("app", "/calendar"):
            return .calendar
        case ("app", "/community"):
            return .community
        case ("app", "/profile"):
            let userId = parameters["id"]
            return userId != nil ? .profile : nil
        case ("app", "/settings"):
            return .settings
        case ("app", "/auth"):
            return .authentication
        default:
            return nil
        }
    }
}

public protocol DeepLinkHandlerDelegate: AnyObject {
    func handle(deepLink: URL) -> Bool
    func canHandle(deepLink: URL) -> Bool
}

public final class DeepLinkHandler: NSObject, DeepLinkHandlerDelegate {
    public static let shared = DeepLinkHandler()
    
    private var handlers: [DeepLinkHandlerDelegate] = []
    
    public override init() {
        super.init()
    }
    
    public func register(_ handler: DeepLinkHandlerDelegate) {
        handlers.append(handler)
    }
    
    public func unregister(_ handler: DeepLinkHandlerDelegate) {
        handlers.removeAll { $0 === handler }
    }
    
    public func handle(deepLink: URL) -> Bool {
        for handler in handlers {
            if handler.handle(deepLink: deepLink) {
                return true
            }
        }
        return false
    }
    
    public func canHandle(deepLink: URL) -> Bool {
        handlers.contains { $0.canHandle(deepLink: deepLink) }
    }
}
