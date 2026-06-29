import SwiftUI

struct SettingsView: View {

    @State
    private var viewModel = SettingsViewModel()

    var body: some View {

        ZStack {

            AppColors.background
                .ignoresSafeArea()

            ScrollView {

                VStack(spacing: 20) {

                    LiquidNavigationBar(
                        title: "설정"
                    )

                    ForEach(viewModel.items, id: \.self) { item in

                        LiquidCard {

                            HStack {

                                Text(item)

                                Spacer()

                                Image(systemName: "chevron.right")

                                    .foregroundStyle(.tertiary)

                            }

                        }

                    }

                }

                .padding(24)

            }

        }

    }

}

#Preview {

    SettingsView()

}