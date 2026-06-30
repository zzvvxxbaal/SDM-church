import SwiftUI

struct SettingsView: View {

    @State

    private var viewModel = SettingsViewModel()

    @State

    private var notification = true

    @State

    private var darkMode = false

    var body: some View {

        ZStack {

            MeshGradientBackground()

            ScrollView {

                VStack(spacing: 18) {

                    LiquidLargeTitle(

                        title: "설정",

                        subtitle: "앱 환경"

                    )

                    Toggle(

                        "알림",

                        isOn: $notification

                    )

                    .toggleStyle(LiquidToggle())

                    Toggle(

                        "다크 모드",

                        isOn: $darkMode

                    )

                    .toggleStyle(LiquidToggle())

                    ForEach(viewModel.items) { item in

                        LiquidListRow {

                            Label(

                                item.title,

                                systemImage: item.icon

                            )

                        }

                    }

                }

                .padding(24)

            }

        }

    }

}