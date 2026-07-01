import Foundation
import Observation

@Observable
final class UserService: BaseService {
    
    var currentUser: User?
    var isAuthenticated: Bool = false
    
    private let persistenceProvider: PersistenceProvider
    
    init(persistenceProvider: PersistenceProvider? = nil) {
        self.persistenceProvider = persistenceProvider ?? UserDefaultsPersistence()
    }
    
    override func initialize() async {
        await loadCurrentUser()
    }
    
    private func loadCurrentUser() async {
        do {
            isLoading = true
            // Prepare for Firebase authentication
            // This will be populated with actual Firebase calls
            isLoading = false
        } catch {
            setError(error)
        }
    }
    
    func updateUser(_ user: User) async {
        do {
            currentUser = user
            try await persistenceProvider.save(user, forKey: "current_user")
            clearError()
        } catch {
            setError(error)
        }
    }
    
    func logout() async {
        currentUser = nil
        isAuthenticated = false
        try? await persistenceProvider.delete(forKey: "current_user")
    }
    
}
