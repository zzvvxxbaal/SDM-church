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
    @Environment(TabBarCoordinator.self) private var coordinator
    let onTabSelected: (Int) -> Void

    @available(*, deprecated, message: "Coordinator is provided through the environment.")
    public init(coordinator: TabBarCoordinator, onTabSelected: @escaping (Int) -> Void) {
        self.onTabSelected = onTabSelected
    }

    public init(onTabSelected: @escaping (Int) -> Void) {
        self.onTabSelected = onTabSelected
    }

    public var body: some View {
        HStack(spacing: AppSpacing.none) {
            ForEach(0..<5, id: \.self) { index in
                Button {
                    coordinator.selectTab(index)
                    onTabSelected(index)
                } label: {
                    TabBarItem(
                        icon: tabIcon(for: index),
                        label: tabLabel(for: index),
                        tag: index,
                        isSelected: coordinator.selectedTab == index
                    )
                }
                .buttonStyle(.plain)
                .accessibilityLabel("\(tabLabel(for: index)) tab")
                .accessibilityHint("Opens the \(tabLabel(for: index)) screen")
            }
        }
        .padding(.vertical, AppSpacing.small)
        .background(AppColors.background.opacity(0.95))
    }

    private func tabIcon(for index: Int) -> String {
        switch index {
        case 0: return "house.fill"
        case 1: return "music.note"
        case 2: return "hands.praying.fill"
        case 3: return "person.fill"
        default: return "gear.fill"
        }
    }

    private func tabLabel(for index: Int) -> String {
        switch index {
        case 0: return "Home"
        case 1: return "Worship"
        case 2: return "Prayer"
        case 3: return "Community"
        default: return "Settings"
        }
    }
}

public struct TabBarItem: View {
    let icon: String
    let label: String
    let tag: Int
    let isSelected: Bool

    public var body: some View {
        VStack(spacing: AppSpacing.xSmall) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(isSelected ? AppColors.tint : AppColors.textSecondary)

            Text(label)
                .font(.caption2)
                .foregroundStyle(isSelected ? AppColors.tint : AppColors.textSecondary)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .accessibilityElement(children: .combine)
    }
}

// MARK: - Navigation Modifiers

public extension View {
    func withAppNavigation(_ coordinator: NavigationCoordinator) -> some View {
        environment(coordinator)
    }

    func enableDeepLinking() -> some View {
        onOpenURL { url in
            let window = UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .first?.windows
                .first

            if window?.rootViewController is UIHostingController<AppNavigationView<AnyView>> {
                DeepLinkManager.open(url, with: NavigationCoordinator())
            }
        }
    }

    func navigationBarAppearance(
        _ appearanceManager: NavigationBarAppearanceManager
    ) -> some View {
        environment(appearanceManager)
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
        sheet(isPresented: isPresented, onDismiss: onDismiss) {
            content()
        }
    }

    func presentFullScreenCover(
        isPresented: Binding<Bool>,
        onDismiss: @escaping () -> Void = {},
        @ViewBuilder content: @escaping () -> some View
    ) -> some View {
        fullScreenCover(isPresented: isPresented, onDismiss: onDismiss) {
            content()
        }
    }

    func presentDialog(
        isPresented: Binding<Bool>,
        title: String,
        message: String,
        @ViewBuilder content: @escaping () -> some View
    ) -> some View {
        modifier(DialogPresentationModifier(
            isPresented: isPresented,
            title: title,
            message: message,
            content: content
        ))
    }
}

public struct DialogPresentationModifier<DialogContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    let title: String
    let message: String
    let content: () -> DialogContent

    public func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented) {
                VStack(spacing: AppSpacing.medium) {
                    VStack(spacing: AppSpacing.small) {
                        Text(title)
                            .font(.headline)

                        Text(message)
                            .font(.subheadline)
                            .foregroundStyle(AppColors.textSecondary)
                    }

                    self.content()

                    Button("Done") {
                        isPresented = false
                    }
                    .buttonStyle(.bordered)
                    .accessibilityHint("Closes this dialog")
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
