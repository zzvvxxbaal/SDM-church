import SwiftUI

public struct FeatureNavigationContainer<Content: View>: View {
    @State private var coordinator = NavigationCoordinator()
    @State private var appearanceManager = NavigationBarAppearanceManager()
    @State private var tabBarCoordinator = TabBarCoordinator()
    
    let title: String
    let subtitle: String?
    let showTabBar: Bool
    let content: (NavigationCoordinator) -> Content
    
    public init(
        title: String,
        subtitle: String? = nil,
        showTabBar: Bool = false,
        @ViewBuilder content: @escaping (NavigationCoordinator) -> Content
    ) {
        self.title = title
        self.subtitle = subtitle
        self.showTabBar = showTabBar
        self.content = content
    }
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            NavigationStack(path: $coordinator.navigationStack) {
                ScrollView {
                    ScrollViewReader { proxy in
                        VStack(alignment: .leading, spacing: 0) {
                            ScrollOffsetTracker { offset in
                                appearanceManager.updateScrollOffset(offset)
                            }
                            
                            LargeTitleView(
                                title: title,
                                subtitle: subtitle ?? "",
                                appearanceManager: appearanceManager
                            )
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            
                            content(coordinator)
                                .padding(.horizontal, 16)
                        }
                    }
                }
                .coordinateSpace(name: "scroll")
                .backSwipeGesture {
                    coordinator.pop()
                }
                .accessibilityNavigation(
                    label: title,
                    hint: subtitle,
                    isNavigationLink: true
                )
            }
            .environment(coordinator)
            
            if showTabBar {
                FloatingGlassTapBar(
                    selectedTab: $tabBarCoordinator.selectedTab
                )
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            appearanceManager.reset()
        }
    }
}

public struct FeatureScreenView<Content: View>: View {
    @Environment(NavigationCoordinator.self) var coordinator
    @State private var appearanceManager = NavigationBarAppearanceManager()
    
    let title: String
    let subtitle: String?
    let showBackButton: Bool
    let content: () -> Content
    
    public init(
        title: String,
        subtitle: String? = nil,
        showBackButton: Bool = true,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.subtitle = subtitle
        self.showBackButton = showBackButton
        self.content = content
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                if showBackButton {
                    HStack {
                        Button(action: { coordinator.pop() }) {
                            HStack(spacing: 4) {
                                Image(systemName: "chevron.left")
                                Text("Back")
                            }
                            .foregroundStyle(AppColors.tint)
                        }
                        Spacer()
                    }
                    .padding(.bottom, 8)
                }
                
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundStyle(AppColors.textSecondary)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            
            ScrollView {
                content()
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
            }
        }
        .navigationBarBackButtonHidden()
        .backSwipeGesture {
            coordinator.pop()
        }
    }
}

public struct FeatureRouteResolver {
    @ViewBuilder
    public static func resolve(_ route: AppRoute) -> some View {
        switch route {
        case .home:
            HomeView()
        case .worship:
            EmptyView()
        case .prayer:
            EmptyView()
        case .notice:
            EmptyView()
        case .calendar:
            EmptyView()
        case .community:
            EmptyView()
        case .profile:
            EmptyView()
        case .settings:
            EmptyView()
        case .authentication:
            EmptyView()
        }
    }
}

public struct FeatureNavigationStack<Content: View>: View {
    @State private var coordinator = NavigationCoordinator()
    let content: (NavigationCoordinator) -> Content
    
    public init(@ViewBuilder content: @escaping (NavigationCoordinator) -> Content) {
        self.content = content
    }
    
    public var body: some View {
        NavigationStack(path: $coordinator.navigationStack) {
            content(coordinator)
                .navigationDestination(for: AppRoute.self) { route in
                    FeatureRouteResolver.resolve(route)
                        .environment(coordinator)
                }
        }
        .environment(coordinator)
    }
}
