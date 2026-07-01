import SwiftUI

// MARK: - Template for Home Feature

public struct HomeFeatureView: View {
    public init() {}

    public var body: some View {
        HomeView()
            .accessibilityNavigation(
                label: "Home",
                hint: "Main app screen with latest updates",
                isNavigationLink: true
            )
    }
}

// MARK: - Template for Prayer Feature

public struct PrayerFeatureView: View {
    public init() {}

    public var body: some View {
        PrayerView()
            .accessibilityNavigation(
                label: "Prayer",
                hint: "Prayer request board",
                isNavigationLink: true
            )
    }
}

// MARK: - Template for Worship Feature

public struct WorshipFeatureView: View {
    public init() {}

    public var body: some View {
        WorshipView()
    }
}

// MARK: - Template for Community Feature

public struct CommunityFeatureView: View {
    public init() {}

    public var body: some View {
        CommunityView()
    }
}

// MARK: - Template for Settings Feature

public struct SettingsFeatureView: View {
    public init() {}

    public var body: some View {
        SettingsView()
    }
}

// MARK: - Template for Notice Feature

public struct NoticeFeatureView: View {
    public init() {}

    public var body: some View {
        NoticeView()
    }
}

// MARK: - Template for Calendar Feature

public struct CalendarFeatureView: View {
    public init() {}

    public var body: some View {
        CalendarView()
    }
}

// MARK: - Template for Profile Feature

public struct ProfileFeatureView: View {
    public init() {}

    public var body: some View {
        ProfileView()
    }
}
