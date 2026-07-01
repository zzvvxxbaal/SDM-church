import Foundation

#if DEBUG

actor MockRepository<Model: Identifiable & Codable>: Repository {
    
    private var items: [Model] = []
    private var shouldFail: Bool = false
    
    init(items: [Model] = [], shouldFail: Bool = false) {
        self.items = items
        self.shouldFail = shouldFail
    }
    
    func fetch(id: Model.ID) async throws -> Model {
        if shouldFail {
            throw RepositoryError.notFound
        }
        guard let item = items.first(where: { $0.id == id }) else {
            throw RepositoryError.notFound
        }
        return item
    }
    
    func fetchAll() async throws -> [Model] {
        if shouldFail {
            throw RepositoryError.loadFailed
        }
        return items
    }
    
    func create(_ model: Model) async throws -> Model {
        if shouldFail {
            throw RepositoryError.saveFailed
        }
        items.append(model)
        return model
    }
    
    func update(_ model: Model) async throws -> Model {
        if shouldFail {
            throw RepositoryError.saveFailed
        }
        if let index = items.firstIndex(where: { $0.id == model.id }) {
            items[index] = model
        }
        return model
    }
    
    func delete(id: Model.ID) async throws {
        if shouldFail {
            throw RepositoryError.saveFailed
        }
        items.removeAll { $0.id == id }
    }
    
}

#endif
