import Foundation

public struct RouteParameter {
    private var parameters: [String: Any] = [:]
    
    public init() {}
    
    public mutating func set<T>(_ key: String, value: T) {
        parameters[key] = value
    }
    
    public func get<T>(_ key: String, as type: T.Type = T.self) -> T? {
        parameters[key] as? T
    }
    
    public func getString(_ key: String) -> String? {
        parameters[key] as? String
    }
    
    public func getInt(_ key: String) -> Int? {
        parameters[key] as? Int
    }
    
    public func getDouble(_ key: String) -> Double? {
        parameters[key] as? Double
    }
    
    public func getBool(_ key: String) -> Bool? {
        parameters[key] as? Bool
    }
}

public extension RouteParameter {
    static let empty = RouteParameter()
}
