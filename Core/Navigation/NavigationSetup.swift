import SwiftUI

public final class NavigationSetup {
    public static let shared = NavigationSetup()
    
    private var isConfigured = false
    private var deepLinkHandlers: [DeepLinkHandlerDelegate] = []
    
    private init() {}
    
    public func configure() {
        guard !isConfigured else { return }
        
        setupDeepLinkHandlers()
        setupWidgetRegistry()
        setupLiveActivityRegistry()
        
        isConfigured = true
    }
    
    private func setupDeepLinkHandlers() {
        let handler = DeepLinkHandler.shared
        
        deepLinkHandlers.forEach { handler.register($0) }
    }
    
    private func setupWidgetRegistry() {
        WidgetRegistry.shared.register(id: "worship_widget", route: .worship)
        WidgetRegistry.shared.register(id: "prayer_widget", route: .prayer)
        WidgetRegistry.shared.register(id: "notice_widget", route: .notice)
        WidgetRegistry.shared.register(id: "calendar_widget", route: .calendar)
    }
    
    private func setupLiveActivityRegistry() {
        LiveActivityRegistry.shared.register(id: "prayer_activity", route: .prayer)
        LiveActivityRegistry.shared.register(id: "worship_activity", route: .worship)
        LiveActivityRegistry.shared.register(id: "notice_activity", route: .notice)
    }
    
    public func registerDeepLinkHandler(_ handler: DeepLinkHandlerDelegate) {
        deepLinkHandlers.append(handler)
        if isConfigured {
            DeepLinkHandler.shared.register(handler)
        }
    }
}

public struct NavigationContainerSetup {
    public static func setupNavigationEnvironment<Content: View>(
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        NavigationSetupView(content: content)
    }
}

public struct NavigationSetupView<Content: View>: View {
    @State private var coordinator = NavigationCoordinator()
    @State private var appearanceManager = NavigationBarAppearanceManager()
    @State private var tabBarCoordinator = TabBarCoordinator()
    @State private var navigationObserver: NSObjectProtocol?
    
    let content: () -> Content
    
    public var body: some View {
        content()
            .environment(coordinator)
            .environment(appearanceManager)
            .environment(tabBarCoordinator)
            .onAppear {
                NavigationSetup.shared.configure()
                setupNavigationNotifications()
            }
            .onDisappear {
                if let navigationObserver {
                    NotificationCenter.default.removeObserver(navigationObserver)
                    self.navigationObserver = nil
                }
            }
    }
    
    private func setupNavigationNotifications() {
        guard navigationObserver == nil else { return }

        navigationObserver = NotificationCenter.default.addObserver(
            forName: NSNotification.Name("NavigationDidChange"),
            object: nil,
            queue: .main
        ) { _ in
            NavigationPerformanceMonitor.shared.recordNavigationEnd(to: .home)
        }
    }
}

public extension View {
    func withNavigationSetup() -> some View {
        self
            .onAppear {
                NavigationSetup.shared.configure()
            }
    }
}

public struct NavigationAppConfiguration {
    public static func configureApp() {
        NavigationSetup.shared.configure()
    }
}

public final class NavigationAppDelegate: NSObject, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        NavigationSetup.shared.configure()
        return true
    }
    
    func application(
        _ application: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        return DeepLinkHandler.shared.handle(deepLink: url)
    }
}

#if DEBUG
public struct NavigationSetupPreview: PreviewProvider {
    public static var previews: some View {
        NavigationSetupView {
            VStack {
                Text("Navigation System Ready")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("All navigation infrastructure is configured and ready to use")
                    .foregroundStyle(AppColors.textSecondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(AppColors.background)
        }
    }
}
#endif
