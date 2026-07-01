import Foundation
import Observation

@Observable
final class AnalyticsService: BaseService {
    
    struct Event {
        let name: String
        let parameters: [String: Any]?
        let timestamp: Date
    }
    
    private var events: [Event] = []
    
    func trackEvent(_ name: String, parameters: [String: Any]? = nil) {
        let event = Event(
            name: name,
            parameters: parameters,
            timestamp: Date()
        )
        events.append(event)
        
        #if DEBUG
        print("[Analytics] Event tracked: \(name)")
        if let params = parameters {
            print("Parameters: \(params)")
        }
        #endif
        
        // This will be connected to Firebase Analytics
    }
    
    func trackScreen(name: String, parameters: [String: Any]? = nil) {
        trackEvent("screen_view", parameters: {
            var params = parameters ?? [:]
            params["screen_name"] = name
            return params
        }())
    }
    
    func trackError(_ error: Error, context: String? = nil) {
        var params = ["error_description": error.localizedDescription]
        if let context = context {
            params["context"] = context
        }
        trackEvent("error_occurred", parameters: params)
    }
    
    func getAllEvents() -> [Event] {
        events
    }
    
    func clearEvents() {
        events.removeAll()
    }
    
}
