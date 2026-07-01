import SwiftUI

// MARK: - Core Navigation Infrastructure

public typealias AppNavigationCoordinator = NavigationCoordinator
public typealias AppTabBarCoordinator = TabBarCoordinator
public typealias AppModalController = ModalPresentationController

// MARK: - Routing System

public extension NavigationCoordinator {
    
    var canNavigateBack: Bool {
        canGoBack()
    }
    
    var hasModal: Bool {
        isModalPresented()
    }
    
    func navigateTo(_ route: AppRoute) {
        navigate(to: route, transition: .push)
    }
    
    func showModal(_ route: AppRoute) {
        presentSheet(route, style: .sheet)
    }
    
    func showFullScreen(_ route: AppRoute) {
        presentSheet(route, style: .fullScreenCover)
    }
    
    func showDialog(_ route: AppRoute) {
        presentSheet(route, style: .dialog)
    }
    
    func hideModal() {
        dismissSheet()
    }
}

// MARK: - Container Views

public struct AppNavigationView<Content: View>: View {
    @State private var coordinator = NavigationCoordinator()
    @State private var appearanceManager = NavigationBarAppearanceManager()
    let content: (NavigationCoordinator) -> Content
    
    public init(@ViewBuilder content: @escaping (NavigationCoordinator) -> Content) {
        self.content = content
    }
    
    public var body: some View {
        NavigationStack(path: $coordinator.navigationStack) {
            content(coordinator)
        }
        .environment(coordinator)
        .environment(appearanceManager)
    }
}

// MARK: - Deep Linking

public struct DeepLinkManager {
    public static func open(_ url: URL, with coordinator: NavigationCoordinator) -> Bool {
        let handler = UniversalLinkHandler(coordinator: coordinator)
        return handler.handle(deepLink: url)
    }
    
    public static func canOpen(_ url: URL) -> Bool {
        DeepLinkRoute(url: url) != nil
    }
}

// MARK: - Tab Bar Management

public struct AppTabBar: View {
    @ObservedObject var coordinator: TabBarCoordinator
    let onTabSelected: (Int) -> Void
    
    public init(
        coordinator: TabBarCoordinator,
        onTabSelected: @escaping (Int) -> Void
    ) {
        self.coordinator = coordinator
        self.onTabSelected = onTabSelected
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            TabBarItem(
                icon: "house.fill",
                label: "Home",
                tag: 0,
                isSelected: coordinator.selectedTab == 0
            )
            .onTapGesture {
                coordinator.selectTab(0)
                onTabSelected(0)
            }
            
            TabBarItem(
                icon: "music.note",
                label: "Worship",
                tag: 1,
                isSelected: coordinator.selectedTab == 1
            )
            .onTapGesture {
                coordinator.selectTab(1)
                onTabSelected(1)
            }
            
            TabBarItem(
                icon: "hands.praying.fill",
                label: "Prayer",
                tag: 2,
                isSelected: coordinator.selectedTab == 2
            )
            .onTapGesture {
                coordinator.selectTab(2)
                onTabSelected(2)
            }
            
            TabBarItem(
                icon: "person.fill",
                label: "Community",
                tag: 3,
                isSelected: coordinator.selectedTab == 3
            )
            .onTapGesture {
                coordinator.selectTab(3)
                onTabSelected(3)
            }
            
            TabBarItem(
                icon: "gear.fill",
                label: "Settings",
                tag: 4,
                isSelected: coordinator.selectedTab == 4
            )
            .onTapGesture {
                coordinator.selectTab(4)
                onTabSelected(4)
            }
        }
        .padding(.vertical, 8)
        .background(Color(.systemBackground).opacity(0.95))
    }
}

public struct TabBarItem: View {
    let icon: String
    let label: String
    let tag: Int
    let isSelected: Bool
    
    public var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(isSelected ? AppColors.tint : .gray)
            
            Text(label)
                .font(.caption2)
                .foregroundColor(isSelected ? AppColors.tint : .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
    }
}

// MARK: - Navigation Modifiers

public extension View {
    
    func withAppNavigation(
        _ coordinator: NavigationCoordinator
    ) -> some View {
        self.environment(coordinator)
    }
    
    func enableDeepLinking() -> some View {
        self.onOpenURL { url in
            let window = UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .first?.windows
                .first
            
            if let rootViewController = window?.rootViewController as? UIHostingController<AppNavigationView<AnyView>> {
                DeepLinkManager.open(url, with: NavigationCoordinator())
            }
        }
    }
    
    func navigationBarAppearance(
        _ appearanceManager: NavigationBarAppearanceManager
    ) -> some View {
        self
            .environment(appearanceManager)
            .largeTitleSynchronizer(appearanceManager)
    }
}

// MARK: - Modal Presentations

public extension View {
    
    func presentSheet(
        isPresented: Binding<Bool>,
        route: AppRoute? = nil,
        onDismiss: @escaping () -> Void = {},
        @ViewBuilder content: @escaping () -> some View
    ) -> some View {
        self.sheet(isPresented: isPresented, onDismiss: onDismiss) {
            content()
        }
    }
    
    func presentFullScreenCover(
        isPresented: Binding<Bool>,
        onDismiss: @escaping () -> Void = {},
        @ViewBuilder content: @escaping () -> some View
    ) -> some View {
        self.fullScreenCover(isPresented: isPresented, onDismiss: onDismiss) {
            content()
        }
    }
    
    func presentDialog(
        isPresented: Binding<Bool>,
        title: String,
        message: String,
        @ViewBuilder content: @escaping () -> some View
    ) -> some View {
        self.modifier(DialogPresentationModifier(
            isPresented: isPresented,
            title: title,
            message: message,
            content: content
        ))
    }
}

public struct DialogPresentationModifier<Content: View>: ViewModifier {
    @Binding var isPresented: Bool
    let title: String
    let message: String
    let content: () -> Content
    
    public func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented) {
                VStack(spacing: 16) {
                    VStack(spacing: 8) {
                        Text(title)
                            .font(.headline)
                        
                        Text(message)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    self.content()
                    
                    Button("Done") {
                        isPresented = false
                    }
                    .buttonStyle(.bordered)
                }
                .padding()
            }
    }
}

// MARK: - Navigation Previews

#if DEBUG
public struct NavigationPreview_Previews: PreviewProvider {
    public static var previews: some View {
        AppNavigationView { coordinator in
            VStack {
                Text("Navigation Demo")
                    .font(.largeTitle)
                
                Button("Navigate") {
                    coordinator.navigate(to: .prayer)
                }
            }
        }
    }
}
#endif
