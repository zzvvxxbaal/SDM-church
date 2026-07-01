import SwiftUI

// MARK: - Navigation Integration Guide

/// # Production-Ready Navigation System
///
/// This guide demonstrates how to use the comprehensive navigation system
/// built for SDM-church app following Apple's first-party iOS design patterns.

// MARK: - 1. Basic Navigation Usage

/// Example: Navigate from one screen to another
public struct NavigationExample_BasicPush: View {
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        Button("Navigate to Prayer") {
            coordinator.navigate(to: .prayer)
        }
    }
}

// MARK: - 2. Modal Presentation

/// Example: Present a modal sheet
public struct NavigationExample_Modal: View {
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        Button("Show Settings Sheet") {
            coordinator.presentSheet(.settings, style: .sheet)
        }
    }
}

// MARK: - 3. Full Screen Cover

/// Example: Present a full-screen cover
public struct NavigationExample_FullScreen: View {
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        Button("Full Screen Presentation") {
            coordinator.presentSheet(.authentication, style: .fullScreenCover)
        }
    }
}

// MARK: - 4. Dismissing Modals

/// Example: Dismiss modal presentations
public struct NavigationExample_Dismiss: View {
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        Button("Close Modal") {
            coordinator.dismissSheet()
        }
    }
}

// MARK: - 5. Tab Navigation

/// Example: Switch between tabs
public struct NavigationExample_TabSwitch: View {
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        Button("Switch to Community Tab") {
            coordinator.selectTab(3)
        }
    }
}

// MARK: - 6. Deep Linking

/// Example: Handle deep links
public struct NavigationExample_DeepLink: View {
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        Button("Open via Deep Link") {
            if let url = URL(string: "sdmchurch://app/prayer") {
                let handler = UniversalLinkHandler(coordinator: coordinator)
                _ = handler.handle(deepLink: url)
            }
        }
    }
}

// MARK: - 7. Back Button with Custom Action

/// Example: Custom back button behavior
public struct NavigationExample_CustomBack: View {
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        HStack {
            Button(action: {
                withAnimation(.easeOut(duration: 0.3)) {
                    coordinator.pop()
                }
            }) {
                HStack(spacing: AppSpacing.xSmall) {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
                .foregroundStyle(AppColors.tint)
            }
            
            Spacer()
        }
    }
}

// MARK: - 8. Gesture-Based Navigation

/// Example: Back swipe gesture
public struct NavigationExample_SwipeBack: View {
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        VStack {
            Text("Swipe from left edge to go back")
                .foregroundStyle(AppColors.textSecondary)
        }
        .backSwipeGesture {
            coordinator.pop()
        }
    }
}

// MARK: - 9. Accessibility Integration

/// Example: Accessible navigation
public struct NavigationExample_Accessibility: View {
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        Button(action: { coordinator.navigate(to: .prayer) }) {
            Text("Prayer Requests")
        }
        .accessibilityNavigation(
            label: "Prayer Requests",
            hint: "Navigate to prayer request board",
            isNavigationLink: true
        )
    }
}

// MARK: - 10. Dynamic Type Support

/// Example: Dynamic Type aware navigation
public struct NavigationExample_DynamicType: View {
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        VStack {
            Text("Navigation System")
                .font(.largeTitle)
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
            
            Button("Navigate") {
                coordinator.navigate(to: .community)
            }
        }
    }
}

// MARK: - 11. Dark Mode Support

/// Example: Dark mode aware navigation
public struct NavigationExample_DarkMode: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        VStack {
            Text("Supported in Light and Dark modes")
                .foregroundColor(colorScheme == .dark ? .white : .black)
            
            Button("Navigate") {
                coordinator.navigate(to: .worship)
            }
        }
    }
}

// MARK: - 12. Performance Optimized Navigation

/// Example: Optimized navigation with performance tracking
public struct NavigationExample_Performance: View {
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        Button("Navigate with Performance Tracking") {
            NavigationPerformanceMonitor.shared.recordNavigationStart(to: .prayer)
            
            coordinator.navigate(to: .prayer)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                NavigationPerformanceMonitor.shared.recordNavigationEnd(to: .prayer)
            }
        }
    }
}

// MARK: - 13. History Navigation

/// Example: Use navigation history
public struct NavigationExample_History: View {
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        VStack {
            Text("Navigation History: \(coordinator.navigationHistory.count) screens")
            
            Button("Show Breadcrumb") {
                let history = coordinator.getBreadcrumb()
                print("Navigation path: \(history)")
            }
        }
    }
}

// MARK: - 14. Modal Stack Management

/// Example: Manage modal stack
public struct NavigationExample_ModalStack: View {
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        VStack {
            Text("Modals on stack: \(coordinator.modalStack.count)")
            
            Button("Pop Modal") {
                coordinator.popModal()
            }
            
            Button("Clear All Modals") {
                coordinator.popAllModals()
            }
        }
    }
}

// MARK: - 15. Widget & Live Activity Routing

/// Example: Route from Widget or Live Activity
public struct NavigationExample_WidgetRouting: View {
    @Environment(NavigationCoordinator.self) var coordinator
    
    public var body: some View {
        VStack {
            Button("Open from Widget") {
                if let route = WidgetRouteHandler.resolve(widgetID: "worship_widget") {
                    coordinator.navigate(to: route)
                }
            }
            
            Button("Open from Live Activity") {
                if let route = LiveActivityRouteHandler.resolve(activityID: "prayer_activity") {
                    coordinator.navigate(to: route)
                }
            }
        }
    }
}

// MARK: - Best Practices

public struct NavigationBestPractices {
    /// 1. Always use @Environment(NavigationCoordinator.self) to access navigation
    /// 2. Use withAnimation() for smooth transitions
    /// 3. Handle deep links in onOpenURL or ScenePhase
    /// 4. Use NavigationAccessibilityHelper for announcement
    /// 5. Track navigation performance with NavigationPerformanceMonitor
    /// 6. Implement proper error handling for failed navigation
    /// 7. Use back swipe gesture for consistency with Apple apps
    /// 8. Preserve tab scroll position when switching tabs
    /// 9. Synchronize Large Title with scroll position
    /// 10. Test navigation with dynamic type and accessibility enabled
}

// MARK: - Feature Screen Template

/// Example: Complete feature screen with integrated navigation
public struct CompleteFeatureExample: View {
    @Environment(NavigationCoordinator.self) var coordinator
    @State private var appearanceManager = NavigationBarAppearanceManager()
    
    public var body: some View {
        VStack(spacing: AppSpacing.none) {
            // Navigation Bar
            HStack {
                Button(action: { coordinator.pop() }) {
                    HStack(spacing: AppSpacing.xSmall) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundStyle(AppColors.tint)
                }
                Spacer()
            }
            .padding(.horizontal, AppSpacing.medium)
            .padding(.vertical, AppSpacing.compact)
            
            // Title with Large Title sync
            LargeTitleView(
                title: "Feature",
                subtitle: "Subtitle",
                appearanceManager: appearanceManager
            )
            .padding(.horizontal, AppSpacing.medium)
            .padding(.vertical, AppSpacing.small)
            
            // Content
            ScrollView {
                VStack(spacing: AppSpacing.medium) {
                    ScrollOffsetTracker { offset in
                        appearanceManager.updateScrollOffset(offset)
                    }
                    
                    Button("Navigate to Next") {
                        coordinator.navigate(to: .prayer)
                    }
                }
                .padding(.horizontal, AppSpacing.medium)
            }
        }
        .navigationBarBackButtonHidden()
        .backSwipeGesture {
            coordinator.pop()
        }
        .accessibilityNavigation(
            label: "Feature Screen",
            hint: "Feature screen description",
            isNavigationLink: true
        )
    }
}

// MARK: - Navigation State Queries

public extension NavigationCoordinator {
    
    /// Check if can navigate back
    var canGoBack: Bool {
        !navigationStack.isEmpty
    }
    
    /// Get current navigation depth
    var depth: Int {
        navigationStack.count
    }
    
    /// Check if specific route is in stack
    func contains(_ route: AppRoute) -> Bool {
        navigationStack.contains(route)
    }
    
    /// Get stack history
    func getHistory() -> [AppRoute] {
        navigationHistory
    }
}
