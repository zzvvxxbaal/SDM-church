import SwiftUI

// MARK: - Design System
public typealias DS = DesignSystemIndex

// MARK: - Core
public typealias Core = CoreIndex

// MARK: - Services
public typealias Services = ServiceContainer

// MARK: - Repositories
public typealias Repo = Repository

// MARK: - Models
public typealias BaseModel = BaseModel
public typealias Identifiable = IdentifiableModel

// MARK: - Networking
public typealias Network = URLSessionNetworkClient
public typealias NetworkError = NetworkError

// MARK: - Persistence
public typealias Persistence = PersistenceProvider

// MARK: - Navigation System
public typealias AppCoordinator = NavigationCoordinator
public typealias AppRoutes = AppRoute
public typealias AppModal = ModalPresentationController
public typealias AppTabs = TabBarCoordinator

// MARK: - Navigation Convenience
public typealias NavCoordinator = NavigationCoordinator
public typealias NavTransition = NavigationTransition
public typealias NavStyle = PresentationStyle
public typealias NavManager = NavigationManager
public typealias NavRouter = AppRouter

// MARK: - Feature Views
public typealias HomeScreen = HomeView
public typealias WorshipScreen = WorshipFeatureView
public typealias PrayerScreen = PrayerFeatureView
public typealias CommunityScreen = CommunityFeatureView
public typealias SettingsScreen = SettingsFeatureView
public typealias NoticeScreen = NoticeFeatureView
public typealias CalendarScreen = CalendarFeatureView
public typealias ProfileScreen = ProfileFeatureView
