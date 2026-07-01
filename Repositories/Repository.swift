import Foundation

protocol Repository<Model> {
    associatedtype Model
    
    func fetch(id: Model.ID) async throws -> Model
    func fetchAll() async throws -> [Model]
    func create(_ model: Model) async throws -> Model
    func update(_ model: Model) async throws -> Model
    func delete(id: Model.ID) async throws
}

protocol PaginatedRepository<Model> {
    associatedtype Model
    
    func fetch(page: Int, pageSize: Int) async throws -> [Model]
    func fetchAll() async throws -> [Model]
}
