import Foundation

protocol BaseModel: Identifiable, Codable {
    associatedtype ID
    var id: ID { get }
    var createdAt: Date { get }
    var updatedAt: Date { get }
}

protocol IdentifiableModel: BaseModel where ID == UUID {
    var name: String { get }
}
