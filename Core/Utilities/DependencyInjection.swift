import SwiftUI

/// Property wrapper for dependency injection
@propertyWrapper
struct Injected<Service> {
    
    private let keyPath: KeyPath<ServiceContainer, Service?>
    
    var wrappedValue: Service? {
        ServiceContainer.shared[keyPath: keyPath]
    }
    
    init(_ keyPath: KeyPath<ServiceContainer, Service?>) {
        self.keyPath = keyPath
    }
    
}

extension ServiceContainer {
    
    var userService: UserService? {
        resolve(UserService.self)
    }
    
    var dataService: DataService? {
        resolve(DataService.self)
    }
    
    var analyticsService: AnalyticsService? {
        resolve(AnalyticsService.self)
    }
    
    var loggingService: LoggingService? {
        resolve(LoggingService.self)
    }
    
    var cacheService: CacheService? {
        resolve(CacheService.self)
    }
    
    var navigationCoordinator: NavigationCoordinator? {
        resolve(NavigationCoordinator.self)
    }
    
    var themeProvider: ThemeProvider? {
        resolve(ThemeProvider.self)
    }
    
}
