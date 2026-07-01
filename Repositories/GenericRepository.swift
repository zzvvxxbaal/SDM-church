import Foundation

actor GenericRepository<Model: Identifiable & Codable>: Repository {
    
    private var items: [Model] = []
    private let persistenceProvider: PersistenceProvider
    private let key: String
    
    init(
        persistenceProvider: PersistenceProvider = UserDefaultsPersistence(),
        key: String
    ) {
        self.persistenceProvider = persistenceProvider
        self.key = key
    }
    
    func fetch(id: Model.ID) async throws -> Model {
        guard let item = items.first(where: { $0.id == id }) else {
            throw RepositoryError.notFound
        }
        return item
    }
    
    func fetchAll() async throws -> [Model] {
        // Try to load from persistence first
        if let cached = try await persistenceProvider.load([Model].self, forKey: key) {
            items = cached
            return cached
        }
        return items
    }
    
    func create(_ model: Model) async throws -> Model {
        items.append(model)
        try await persistenceProvider.save(items, forKey: key)
        return model
    }
    
    func update(_ model: Model) async throws -> Model {
        if let index = items.firstIndex(where: { $0.id == model.id }) {
            items[index] = model
            try await persistenceProvider.save(items, forKey: key)
        }
        return model
    }
    
    func delete(id: Model.ID) async throws {
        items.removeAll { $0.id == id }
        try await persistenceProvider.save(items, forKey: key)
    }
    
}

enum RepositoryError: LocalizedError {
    case notFound
    case saveFailed
    case loadFailed
    
    var errorDescription: String? {
        switch self {
        case .notFound: return "Item not found"
        case .saveFailed: return "Failed to save item"
        case .loadFailed: return "Failed to load items"
        }
    }
}
