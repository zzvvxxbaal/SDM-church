import SwiftUI

@main
struct SDMYouthApp: App {
    @UIApplicationDelegateAdaptor(NavigationAppDelegate.self) var appDelegate
    @State private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(appState)
                .withNavigationSetup()
                .onAppear {
                    NavigationSetup.shared.configure()
                }
        }
    }
}
