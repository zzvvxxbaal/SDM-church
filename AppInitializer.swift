import Foundation
import Observation

@Observable
final class AppInitializer {
    
    private(set) var isInitialized: Bool = false
    private(set) var initializationError: Error?
    
    private let serviceContainer: ServiceContainer
    
    init(serviceContainer: ServiceContainer = .shared) {
        self.serviceContainer = serviceContainer
    }
    
    func initializeApp() async {
        do {
            // Initialize Firebase if enabled
            if AppConfiguration.FeatureFlags.enableFirebase {
                // Firebase initialization will go here
            }
            
            // Initialize SwiftData if enabled
            if AppConfiguration.FeatureFlags.enableSwiftData {
                // SwiftData initialization will go here
            }
            
            // Setup core services
            let userService = UserService()
            let dataService = DataService()
            let analyticsService = AnalyticsService()
            let loggingService = LoggingService()
            let cacheService = CacheService()
            let navigationCoordinator = NavigationCoordinator()
            let themeProvider = ThemeProvider()
            
            serviceContainer.register(userService, for: UserService.self)
            serviceContainer.register(dataService, for: DataService.self)
            serviceContainer.register(analyticsService, for: AnalyticsService.self)
            serviceContainer.register(loggingService, for: LoggingService.self)
            serviceContainer.register(cacheService, for: CacheService.self)
            serviceContainer.register(navigationCoordinator, for: NavigationCoordinator.self)
            serviceContainer.register(themeProvider, for: ThemeProvider.self)
            
            // Initialize services
            await userService.initialize()
            await dataService.initialize()
            await analyticsService.initialize()
            await loggingService.log("App initialized", level: .info, category: "AppInitializer")
            
            isInitialized = true
        } catch {
            initializationError = error
        }
    }
    
    func cleanup() async {
        if let userService = serviceContainer.resolve(UserService.self) {
            await userService.cleanup()
        }
        
        if let dataService = serviceContainer.resolve(DataService.self) {
            await dataService.cleanup()
        }
        
        isInitialized = false
    }
    
}
