import Observation
import SwiftUI

struct RootView: View {
    @Environment(AppState.self) private var appState
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
                        .accessibilityLabel("Home tab")
                        .accessibilityIdentifier("tab-home")

                    WorshipView()
                        .tag(1)
                        .tabItem {
                            Label("Worship", systemImage: "music.note")
                        }
                        .accessibilityLabel("Worship tab")
                        .accessibilityIdentifier("tab-worship")

                    PrayerView()
                        .tag(2)
                        .tabItem {
                            Label("Prayer", systemImage: "hands.praying.fill")
                        }
                        .accessibilityLabel("Prayer tab")
                        .accessibilityIdentifier("tab-prayer")

                    CommunityView()
                        .tag(3)
                        .tabItem {
                            Label("Community", systemImage: "person.fill")
                        }
                        .accessibilityLabel("Community tab")
                        .accessibilityIdentifier("tab-community")

                    SettingsView()
                        .tag(4)
                        .tabItem {
                            Label("Settings", systemImage: "gear.fill")
                        }
                        .accessibilityLabel("Settings tab")
                        .accessibilityIdentifier("tab-settings")
                }
                .navigationDestination(for: AppRoute.self) { route in
                    destinationView(for: route)
                }
            }
        }
        .preferredColorScheme(appState.preferredColorScheme)
        .tint(AppColors.tint)
        .dynamicTypeNavigation()
        .onChange(of: tabBarCoordinator.selectedTab) { _, newValue in
            coordinator.selectTab(newValue)
            NavigationAccessibilityHelper.announceTabSwitch(tabName: tabName(for: newValue))
        }
        .onChange(of: coordinator.navigationStack) { oldValue, newValue in
            let fromScreen = oldValue.last.map(routeName(for:)) ?? tabName(for: tabBarCoordinator.selectedTab)
            let toScreen = newValue.last.map(routeName(for:)) ?? tabName(for: tabBarCoordinator.selectedTab)

            guard fromScreen != toScreen else { return }
            NavigationAccessibilityHelper.announceNavigation(from: fromScreen, to: toScreen)
        }
    }

    @ViewBuilder
    private func destinationView(for route: AppRoute) -> some View {
        switch route {
        case .home:
            HomeView()
        case .worship:
            WorshipView()
        case .prayer:
            PrayerView()
        case .notice:
            NoticeView()
        case .calendar:
            CalendarView()
        case .community:
            CommunityView()
        case .profile:
            ProfileView()
        case .settings:
            SettingsView()
        case .authentication:
            LoginView()
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

    private func routeName(for route: AppRoute) -> String {
        switch route {
        case .home:
            return "Home"
        case .worship:
            return "Worship"
        case .prayer:
            return "Prayer"
        case .notice:
            return "Notice"
        case .calendar:
            return "Calendar"
        case .community:
            return "Community"
        case .profile:
            return "Profile"
        case .settings:
            return "Settings"
        case .authentication:
            return "Authentication"
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
