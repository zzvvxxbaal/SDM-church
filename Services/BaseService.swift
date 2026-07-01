import Foundation
import Observation

@Observable
open class BaseService {
    
    var isLoading: Bool = false
    var lastError: Error?
    
    open func initialize() async {
        // Override in subclasses
    }
    
    open func cleanup() async {
        // Override in subclasses
    }
    
    func setError(_ error: Error) {
        lastError = error
    }
    
    func clearError() {
        lastError = nil
    }
    
}
