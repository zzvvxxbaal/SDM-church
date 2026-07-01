import Foundation
import Observation

@Observable
final class CacheService: BaseService {
    
    private var cache: [String: CacheItem] = [:]
    private let maxCacheSize: Int = 100
    private let defaultTTL: TimeInterval = 3600 // 1 hour
    
    private struct CacheItem {
        let data: Data
        let timestamp: Date
        let ttl: TimeInterval
        
        var isExpired: Bool {
            Date().timeIntervalSince(timestamp) > ttl
        }
    }
    
    func set<T: Encodable>(_ value: T, forKey key: String, ttl: TimeInterval? = nil) throws {
        let encoder = JSONEncoder()
        let data = try encoder.encode(value)
        
        let item = CacheItem(
            data: data,
            timestamp: Date(),
            ttl: ttl ?? defaultTTL
        )
        
        cache[key] = item
        
        if cache.count > maxCacheSize {
            pruneExpiredItems()
        }
    }
    
    func get<T: Decodable>(_ type: T.Type, forKey key: String) throws -> T? {
        guard let item = cache[key], !item.isExpired else {
            cache.removeValue(forKey: key)
            return nil
        }
        
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: item.data)
    }
    
    func remove(forKey key: String) {
        cache.removeValue(forKey: key)
    }
    
    func clear() {
        cache.removeAll()
    }
    
    private func pruneExpiredItems() {
        cache = cache.filter { !$0.value.isExpired }
    }
    
}
