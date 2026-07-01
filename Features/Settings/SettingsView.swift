import Observation
import SwiftUI

struct SettingsView: View {
    @Environment(AppState.self) private var appState
    private let viewModel = SettingsViewModel()

    var body: some View {
        @Bindable var appState = appState

        return ZStack {
            MeshGradientBackground()

            ScrollView {
                LazyVStack(spacing: AppSpacing.content) {
                    LiquidLargeTitle(
                        title: "설정",
                        subtitle: "앱 환경"
                    )

                    Toggle("알림", isOn: $appState.notificationsEnabled)
                        .toggleStyle(LiquidToggle())
                        .accessibilityLabel("알림")
                        .accessibilityValue(appState.notificationsEnabled ? "켜짐" : "꺼짐")

                    Toggle("다크 모드", isOn: $appState.isDarkModeEnabled)
                        .toggleStyle(LiquidToggle())
                        .accessibilityLabel("다크 모드")
                        .accessibilityValue(appState.isDarkModeEnabled ? "켜짐" : "꺼짐")

                    AboutCard()
                        .id("about-card")

                    ForEach(viewModel.items) { item in
                        LiquidListRow {
                            Label(item.title, systemImage: item.icon)
                        }
                        .id(item.id)
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel(item.title)
                    }
                }
                .padding(AppSpacing.large)
            }
        }
    }
}
