import Foundation
import Observation

@Observable
final class ServiceContainer {
    
    private var services: [String: Any] = [:]
    
    func register<T>(_ service: T, for type: T.Type) {
        let key = String(describing: type)
        services[key] = service
    }
    
    func resolve<T>(_ type: T.Type) -> T? {
        let key = String(describing: type)
        return services[key] as? T
    }
    
    func unregister<T>(_ type: T.Type) {
        let key = String(describing: type)
        services.removeValue(forKey: key)
    }
    
    static let shared = ServiceContainer()
    
}

extension ServiceContainer {
    
    func setupAll() async {
        // This will be populated with Firebase setup, SwiftData setup, etc.
    }
    
}
