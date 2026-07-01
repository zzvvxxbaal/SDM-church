import Foundation
import Observation

@Observable
final class DataService: BaseService {
    
    var prayers: [Prayer] = []
    var events: [ChurchEvent] = []
    var devotionals: [Devotional] = []
    var notices: [Notice] = []
    
    private let networkClient: URLSessionNetworkClient
    private let persistenceProvider: PersistenceProvider
    
    init(
        networkClient: URLSessionNetworkClient? = nil,
        persistenceProvider: PersistenceProvider? = nil
    ) {
        self.networkClient = networkClient ?? URLSessionNetworkClient()
        self.persistenceProvider = persistenceProvider ?? UserDefaultsPersistence()
    }
    
    override func initialize() async {
        await refreshData()
    }
    
    func refreshData() async {
        do {
            isLoading = true
            // Prepare for Firebase Firestore integration
            // This will fetch data from Firebase instead of local storage
            try await loadLocalData()
            isLoading = false
            clearError()
        } catch {
            setError(error)
        }
    }
    
    private func loadLocalData() async throws {
        // Load from persistence layer
        // This will be replaced with SwiftData queries
    }
    
    func addPrayer(_ prayer: Prayer) async {
        prayers.append(prayer)
        try? await persistenceProvider.save(prayers, forKey: "prayers")
    }
    
    func deletePrayer(id: UUID) async {
        prayers.removeAll { $0.id == id }
        try? await persistenceProvider.save(prayers, forKey: "prayers")
    }
    
}
