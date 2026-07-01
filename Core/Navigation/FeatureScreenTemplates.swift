import SwiftUI

// MARK: - Template for Home Feature

public struct HomeFeatureView: View {
    @Environment(NavigationCoordinator.self) var coordinator
    @State private var appearanceManager = NavigationBarAppearanceManager()
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            MeshGradientBackground()
            
            ScrollView {
                VStack(spacing: 24) {
                    ScrollOffsetTracker { offset in
                        appearanceManager.updateScrollOffset(offset)
                    }
                    
                    LargeTitleView(
                        title: "서대문교회",
                        subtitle: "청년부",
                        appearanceManager: appearanceManager
                    )
                    
                    HomeHeader()
                    QuickMenu()
                    TodayVerseCard()
                    HomeBanner()
                    AttendanceCard()
                    UpcomingEventCard()
                    PrayerSummaryCard()
                    WeeklyVerseCard()
                    WorshipCountdownCard()
                    ChurchEventCard()
                    RecentNoticeCard()
                    WelcomeCard()
                    DevotionalCard()
                    MinistryCard()
                    OfferingCard()
                }
                .padding(.horizontal, 16)
            }
            .coordinateSpace(name: "scroll")
        }
        .backSwipeGesture {
            coordinator.pop()
        }
        .navigationBarBackButtonHidden()
        .accessibilityNavigation(
            label: "Home",
            hint: "Main app screen with latest updates",
            isNavigationLink: true
        )
    }
}

// MARK: - Template for Prayer Feature

public struct PrayerFeatureView: View {
    @Environment(NavigationCoordinator.self) var coordinator
    @State private var appearanceManager = NavigationBarAppearanceManager()
    
    public var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Button(action: { coordinator.pop() }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(.blue)
                    }
                    Spacer()
                }
                .padding(.bottom, 8)
                
                Text("Prayer")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Share your prayer requests")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            
            ScrollView {
                VStack(spacing: 16) {
                    // Prayer content here
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
            }
        }
        .navigationBarBackButtonHidden()
        .backSwipeGesture {
            coordinator.pop()
        }
        .accessibilityNavigation(
            label: "Prayer",
            hint: "Prayer request board",
            isNavigationLink: true
        )
    }
}

// MARK: - Template for Worship Feature

public struct WorshipFeatureView: View {
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Button(action: { coordinator.pop() }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(.blue)
                    }
                    Spacer()
                }
                .padding(.bottom, 8)
                
                Text("Worship")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            
            ScrollView {
                VStack(spacing: 16) {
                    // Worship content here
                }
                .padding(.horizontal, 16)
            }
        }
        .navigationBarBackButtonHidden()
        .backSwipeGesture {
            coordinator.pop()
        }
    }
}

// MARK: - Template for Community Feature

public struct CommunityFeatureView: View {
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Button(action: { coordinator.pop() }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(.blue)
                    }
                    Spacer()
                }
                .padding(.bottom, 8)
                
                Text("Community")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            
            ScrollView {
                VStack(spacing: 16) {
                    // Community content here
                }
                .padding(.horizontal, 16)
            }
        }
        .navigationBarBackButtonHidden()
        .backSwipeGesture {
            coordinator.pop()
        }
    }
}

// MARK: - Template for Settings Feature

public struct SettingsFeatureView: View {
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Button(action: { coordinator.pop() }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(.blue)
                    }
                    Spacer()
                }
                .padding(.bottom, 8)
                
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            
            ScrollView {
                VStack(spacing: 16) {
                    // Settings content here
                }
                .padding(.horizontal, 16)
            }
        }
        .navigationBarBackButtonHidden()
        .backSwipeGesture {
            coordinator.pop()
        }
    }
}

// MARK: - Template for Notice Feature

public struct NoticeFeatureView: View {
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Button(action: { coordinator.pop() }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(.blue)
                    }
                    Spacer()
                }
                .padding(.bottom, 8)
                
                Text("Notice")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            
            ScrollView {
                VStack(spacing: 16) {
                    // Notice content here
                }
                .padding(.horizontal, 16)
            }
        }
        .navigationBarBackButtonHidden()
        .backSwipeGesture {
            coordinator.pop()
        }
    }
}

// MARK: - Template for Calendar Feature

public struct CalendarFeatureView: View {
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Button(action: { coordinator.pop() }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(.blue)
                    }
                    Spacer()
                }
                .padding(.bottom, 8)
                
                Text("Calendar")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            
            ScrollView {
                VStack(spacing: 16) {
                    // Calendar content here
                }
                .padding(.horizontal, 16)
            }
        }
        .navigationBarBackButtonHidden()
        .backSwipeGesture {
            coordinator.pop()
        }
    }
}

// MARK: - Template for Profile Feature

public struct ProfileFeatureView: View {
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Button(action: { coordinator.pop() }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(.blue)
                    }
                    Spacer()
                }
                .padding(.bottom, 8)
                
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            
            ScrollView {
                VStack(spacing: 16) {
                    // Profile content here
                }
                .padding(.horizontal, 16)
            }
        }
        .navigationBarBackButtonHidden()
        .backSwipeGesture {
            coordinator.pop()
        }
    }
}
