import SwiftUI

struct RootView: View {
    @State private var appState = AppState()
    @State private var coordinator = NavigationCoordinator()
    @State private var tabBarCoordinator = TabBarCoordinator()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationStack(path: $coordinator.navigationStack) {
                TabView(selection: $tabBarCoordinator.selectedTab) {
                    // Home Tab
                    HomeView()
                        .tag(0)
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                    
                    // Worship Tab
                    WorshipFeatureView()
                        .tag(1)
                        .tabItem {
                            Image(systemName: "music.note")
                            Text("Worship")
                        }
                    
                    // Prayer Tab
                    PrayerFeatureView()
                        .tag(2)
                        .tabItem {
                            Image(systemName: "hands.praying.fill")
                            Text("Prayer")
                        }
                    
                    // Community Tab
                    CommunityFeatureView()
                        .tag(3)
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Community")
                        }
                    
                    // Settings Tab
                    SettingsFeatureView()
                        .tag(4)
                        .tabItem {
                            Image(systemName: "gear.fill")
                            Text("Settings")
                        }
                }
                .navigationDestination(for: AppRoute.self) { route in
                    destinationView(for: route)
                }
            }
            .environment(coordinator)
            .environment(appState)
        }
        .preferredColorScheme(.light)
        .tint(AppColors.tint)
        .onChange(of: tabBarCoordinator.selectedTab) { oldValue, newValue in
            coordinator.selectTab(newValue)
            NavigationAccessibilityHelper.announceTabSwitch(
                tabName: getTabName(newValue)
            )
        }
    }
    
    @ViewBuilder
    private func destinationView(for route: AppRoute) -> some View {
        switch route {
        case .home:
            HomeView()
        case .worship:
            WorshipFeatureView()
        case .prayer:
            PrayerFeatureView()
        case .notice:
            NoticeFeatureView()
        case .calendar:
            CalendarFeatureView()
        case .community:
            CommunityFeatureView()
        case .profile:
            ProfileFeatureView()
        case .settings:
            SettingsFeatureView()
        case .authentication:
            EmptyView()
        }
    }
    
    private func getTabName(_ index: Int) -> String {
        switch index {
        case 0: return "Home"
        case 1: return "Worship"
        case 2: return "Prayer"
        case 3: return "Community"
        case 4: return "Settings"
        default: return "Tab"
        }
    }
}

#Preview {
    RootView()
}