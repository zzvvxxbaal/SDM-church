import SwiftUI

// MARK: - Template for Home Feature

public struct HomeFeatureView: View {
    @Environment(NavigationCoordinator.self) var coordinator
    @State private var appearanceManager = NavigationBarAppearanceManager()
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            MeshGradientBackground()
            
            ScrollView {
                VStack(spacing: AppSpacing.large) {
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
                .padding(.horizontal, AppSpacing.medium)
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
        VStack(spacing: AppSpacing.none) {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                HStack {
                    Button(action: { coordinator.pop() }) {
                        HStack(spacing: AppSpacing.xSmall) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundStyle(AppColors.tint)
                    }
                    .accessibilityLabel("Go back")
                    .accessibilityHint("Returns to the previous screen")
                    Spacer()
                }
                .padding(.bottom, AppSpacing.small)
                
                Text("Prayer")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Share your prayer requests")
                    .font(.caption)
                    .foregroundStyle(AppColors.textSecondary)
            }
            .padding(.horizontal, AppSpacing.medium)
            .padding(.vertical, AppSpacing.compact)
            
            ScrollView {
                VStack(spacing: AppSpacing.medium) {
                    // Prayer content here
                }
                .padding(.horizontal, AppSpacing.medium)
                .padding(.vertical, AppSpacing.compact)
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
        VStack(spacing: AppSpacing.none) {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                HStack {
                    Button(action: { coordinator.pop() }) {
                        HStack(spacing: AppSpacing.xSmall) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundStyle(AppColors.tint)
                    }
                    .accessibilityLabel("Go back")
                    .accessibilityHint("Returns to the previous screen")
                    Spacer()
                }
                .padding(.bottom, AppSpacing.small)
                
                Text("Worship")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, AppSpacing.medium)
            .padding(.vertical, AppSpacing.compact)
            
            ScrollView {
                VStack(spacing: AppSpacing.medium) {
                    // Worship content here
                }
                .padding(.horizontal, AppSpacing.medium)
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
        VStack(spacing: AppSpacing.none) {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                HStack {
                    Button(action: { coordinator.pop() }) {
                        HStack(spacing: AppSpacing.xSmall) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundStyle(AppColors.tint)
                    }
                    .accessibilityLabel("Go back")
                    .accessibilityHint("Returns to the previous screen")
                    Spacer()
                }
                .padding(.bottom, AppSpacing.small)
                
                Text("Community")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, AppSpacing.medium)
            .padding(.vertical, AppSpacing.compact)
            
            ScrollView {
                VStack(spacing: AppSpacing.medium) {
                    // Community content here
                }
                .padding(.horizontal, AppSpacing.medium)
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
        VStack(spacing: AppSpacing.none) {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                HStack {
                    Button(action: { coordinator.pop() }) {
                        HStack(spacing: AppSpacing.xSmall) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundStyle(AppColors.tint)
                    }
                    .accessibilityLabel("Go back")
                    .accessibilityHint("Returns to the previous screen")
                    Spacer()
                }
                .padding(.bottom, AppSpacing.small)
                
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, AppSpacing.medium)
            .padding(.vertical, AppSpacing.compact)
            
            ScrollView {
                VStack(spacing: AppSpacing.medium) {
                    // Settings content here
                }
                .padding(.horizontal, AppSpacing.medium)
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
        VStack(spacing: AppSpacing.none) {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                HStack {
                    Button(action: { coordinator.pop() }) {
                        HStack(spacing: AppSpacing.xSmall) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundStyle(AppColors.tint)
                    }
                    .accessibilityLabel("Go back")
                    .accessibilityHint("Returns to the previous screen")
                    Spacer()
                }
                .padding(.bottom, AppSpacing.small)
                
                Text("Notice")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, AppSpacing.medium)
            .padding(.vertical, AppSpacing.compact)
            
            ScrollView {
                VStack(spacing: AppSpacing.medium) {
                    // Notice content here
                }
                .padding(.horizontal, AppSpacing.medium)
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
        VStack(spacing: AppSpacing.none) {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                HStack {
                    Button(action: { coordinator.pop() }) {
                        HStack(spacing: AppSpacing.xSmall) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundStyle(AppColors.tint)
                    }
                    .accessibilityLabel("Go back")
                    .accessibilityHint("Returns to the previous screen")
                    Spacer()
                }
                .padding(.bottom, AppSpacing.small)
                
                Text("Calendar")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, AppSpacing.medium)
            .padding(.vertical, AppSpacing.compact)
            
            ScrollView {
                VStack(spacing: AppSpacing.medium) {
                    // Calendar content here
                }
                .padding(.horizontal, AppSpacing.medium)
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
        VStack(spacing: AppSpacing.none) {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                HStack {
                    Button(action: { coordinator.pop() }) {
                        HStack(spacing: AppSpacing.xSmall) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundStyle(AppColors.tint)
                    }
                    .accessibilityLabel("Go back")
                    .accessibilityHint("Returns to the previous screen")
                    Spacer()
                }
                .padding(.bottom, AppSpacing.small)
                
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, AppSpacing.medium)
            .padding(.vertical, AppSpacing.compact)
            
            ScrollView {
                VStack(spacing: AppSpacing.medium) {
                    // Profile content here
                }
                .padding(.horizontal, AppSpacing.medium)
            }
        }
        .navigationBarBackButtonHidden()
        .backSwipeGesture {
            coordinator.pop()
        }
    }
}
