import SwiftUI

struct SettingsView: View {
    @State private var viewModel = SettingsViewModel()
    @State private var notification = true
    @State private var darkMode = false

    var body: some View {
        ZStack {
            MeshGradientBackground()

            ScrollView {
                VStack(spacing: AppSpacing.content) {
                    LiquidLargeTitle(
                        title: "설정",
                        subtitle: "앱 환경"
                    )

                    Toggle("알림", isOn: $notification)
                        .toggleStyle(LiquidToggle())
                        .accessibilityLabel("알림")
                        .accessibilityValue(notification ? "켜짐" : "꺼짐")

                    Toggle("다크 모드", isOn: $darkMode)
                        .toggleStyle(LiquidToggle())
                        .accessibilityLabel("다크 모드")
                        .accessibilityValue(darkMode ? "켜짐" : "꺼짐")

                    ForEach(viewModel.items) { item in
                        AboutCard()

                        LiquidListRow {
                            Label(item.title, systemImage: item.icon)
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel(item.title)
                    }
                }
                .padding(AppSpacing.large)
            }
        }
    }
}
