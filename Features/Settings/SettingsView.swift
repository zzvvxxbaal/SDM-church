import Observation
import SwiftUI

struct SettingsView: View {
    @Environment(AppState.self) private var appState
    private let viewModel = SettingsViewModel()

    var body: some View {

    ZStack {

        MeshGradientBackground()

        ScrollView(.vertical, showsIndicators: false) {

            LazyVStack(
                spacing: 28
            ) {

                LiquidLargeTitle(

                    title: "설정",

                    subtitle: "Settings"

                )

                SettingsAccountCard()

                SettingsAppearanceCard()

                SettingsNotificationCard()

                SettingsAboutCard()

                Color.clear

                    .frame(height: 120)

            }

            .padding(.horizontal, 24)

            .padding(.top, 24)

        }

    }

}
