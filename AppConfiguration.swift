import Foundation

enum AppConfiguration {
    
    enum Environment {
        case development
        case staging
        case production
    }
    
    static let environment: Environment = {
        #if DEBUG
        return .development
        #else
        return .production
        #endif
    }()
    
    static let appVersion = Bundle.main.appVersion
    static let buildNumber = Bundle.main.buildNumber
    
    enum FeatureFlags {
        static let enableWidgets: Bool = false
        static let enableLiveActivities: Bool = false
        static let enableMetalRendering: Bool = false
        static let enableSwiftData: Bool = false
        static let enableFirebase: Bool = false
    }
    
    enum API {
        static let baseURL = URL(string: "https://api.example.com")!
        static let timeout: TimeInterval = 30
        static let retryAttempts = 3
    }
    
}

extension Bundle {
    
    var appVersion: String {
        infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
    }
    
    var buildNumber: String {
        infoDictionary?["CFBundleVersion"] as? String ?? "1"
    }
    
}
