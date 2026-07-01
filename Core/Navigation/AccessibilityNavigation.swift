import SwiftUI
import Accessibility

public struct AccessibilityNavigationModifier: ViewModifier {
    let label: String
    let hint: String?
    let isNavigationLink: Bool
    
    public func body(content: Content) -> some View {
        content
            .accessibilityLabel(label)
            .accessibilityHint(hint ?? "")
            .accessibilityAddTraits(isNavigationLink ? .isButton : [])
    }
}

public struct DynamicTypeNavigationModifier: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    
    public func body(content: Content) -> some View {
        content
            .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
    }
}

public struct DarkModeNavigationModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    public func body(content: Content) -> some View {
        content
            .preferredColorScheme(nil)
    }
}

public struct NavigationAccessibilityContainer: View {
    let navigationStack: [AppRoute]
    let content: () -> AnyView
    
    public var body: some View {
        content()
            .accessibilityElement(children: .combine)
            .accessibilityLabel("Navigation hierarchy")
            .accessibilityValue("Screen \(navigationStack.count) of navigation stack")
    }
}

public struct AccessibleNavigationBar: View {
    let title: String
    let subtitle: String?
    let showBackButton: Bool
    let onBack: () -> Void
    
    public var body: some View {
        HStack(spacing: 12) {
            if showBackButton {
                Button(action: onBack) {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundColor(.blue)
                }
                .accessibilityLabel("Go back")
                .accessibilityHint("Returns to the previous screen")
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.headline)
                    .accessibilityAddTraits(.isHeader)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

public extension View {
    func accessibilityNavigation(
        label: String,
        hint: String? = nil,
        isNavigationLink: Bool = false
    ) -> some View {
        modifier(AccessibilityNavigationModifier(
            label: label,
            hint: hint,
            isNavigationLink: isNavigationLink
        ))
    }
    
    func dynamicTypeNavigation() -> some View {
        modifier(DynamicTypeNavigationModifier())
    }
    
    func darkModeNavigation() -> some View {
        modifier(DarkModeNavigationModifier())
    }
}

public final class NavigationAccessibilityHelper {
    public static func announceNavigation(from: String, to: String) {
        let announcement = "\(from) page dismissed. Now showing \(to) page."
        UIAccessibility.post(notification: .announcement, argument: announcement)
    }
    
    public static func announceModalPresented(title: String) {
        let announcement = "Modal presented: \(title)"
        UIAccessibility.post(notification: .announcement, argument: announcement)
    }
    
    public static func announceDismissed(title: String) {
        let announcement = "\(title) modal dismissed"
        UIAccessibility.post(notification: .announcement, argument: announcement)
    }
    
    public static func announceTabSwitch(tabName: String) {
        let announcement = "Switched to \(tabName) tab"
        UIAccessibility.post(notification: .pageScrolled, argument: announcement)
    }
}

public struct PerformanceOptimizedNavigation: ViewModifier {
    @State private var isViewReady = false
    let onViewReady: (() -> Void)?
    
    public func body(content: Content) -> some View {
        content
            .onAppear {
                isViewReady = true
                onViewReady?()
            }
            .modifier(LazyLoadingModifier())
    }
}

public struct LazyLoadingModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .transition(.opacity.combined(with: .move(edge: .trailing)))
    }
}

public struct NavigationCachingStrategy {
    public enum CacheLevel {
        case none
        case minimal
        case standard
        case aggressive
    }
    
    private var cacheLevel: CacheLevel
    private var cachedRoutes: [AppRoute: AnyView] = [:]
    
    public init(level: CacheLevel = .standard) {
        self.cacheLevel = level
    }
    
    public mutating func cache(_ route: AppRoute, view: AnyView) {
        if cacheLevel != .none {
            cachedRoutes[route] = view
        }
    }
    
    public func retrieve(_ route: AppRoute) -> AnyView? {
        cachedRoutes[route]
    }
    
    public mutating func clearCache() {
        cachedRoutes.removeAll()
    }
}

public final class NavigationPerformanceMonitor {
    public static let shared = NavigationPerformanceMonitor()
    
    private var navigationTimes: [String: TimeInterval] = [:]
    
    public func recordNavigationStart(to route: AppRoute) {
        navigationTimes["start_\(route)"] = Date().timeIntervalSince1970
    }
    
    public func recordNavigationEnd(to route: AppRoute) {
        let startKey = "start_\(route)"
        if let startTime = navigationTimes[startKey] {
            let duration = Date().timeIntervalSince1970 - startTime
            navigationTimes["duration_\(route)"] = duration
            
            if duration > 0.5 {
                print("⚠️ Slow navigation to \(route): \(duration)s")
            }
        }
    }
    
    public func getNavigationDuration(to route: AppRoute) -> TimeInterval? {
        navigationTimes["duration_\(route)"]
    }
}
