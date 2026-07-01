import Observation
import SwiftUI

struct RootView: View {
    @Environment(NavigationCoordinator.self) private var coordinator
    @Environment(TabBarCoordinator.self) private var tabBarCoordinator

    var body: some View {
        @Bindable var coordinator = coordinator
        @Bindable var tabBarCoordinator = tabBarCoordinator

        ZStack(alignment: .bottom) {
            NavigationStack(path: $coordinator.navigationStack) {
                TabView(selection: $tabBarCoordinator.selectedTab) {
                    HomeView()
                        .tag(0)
                        .tabItem {
                            Label("Home", systemImage: "house.fill")
                        }

                    WorshipFeatureView()
                        .tag(1)
                        .tabItem {
                            Label("Worship", systemImage: "music.note")
                        }

                    PrayerFeatureView()
                        .tag(2)
                        .tabItem {
                            Label("Prayer", systemImage: "hands.praying.fill")
                        }

                    CommunityFeatureView()
                        .tag(3)
                        .tabItem {
                            Label("Community", systemImage: "person.fill")
                        }

                    SettingsFeatureView()
                        .tag(4)
                        .tabItem {
                            Label("Settings", systemImage: "gear.fill")
                        }
                }
                .navigationDestination(for: AppRoute.self) { route in
                    destinationView(for: route)
                }
            }
        }
        .preferredColorScheme(nil)
        .tint(AppColors.tint)
        .dynamicTypeNavigation()
        .onChange(of: tabBarCoordinator.selectedTab) { _, newValue in
            coordinator.selectTab(newValue)
            NavigationAccessibilityHelper.announceTabSwitch(tabName: tabName(for: newValue))
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

    private func tabName(for index: Int) -> String {
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
    let appState = AppState()

    RootView()
        .environment(appState)
        .environment(appState.navigationCoordinator)
        .environment(appState.tabBarCoordinator)
}
