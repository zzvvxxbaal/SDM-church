import SwiftUI

struct WorshipView: View {

    @State
    private var viewModel = WorshipViewModel()

    var body: some View {

        ZStack {

            AppColors.background
                .ignoresSafeArea()

            ScrollView(.vertical, showsIndicators: false) {

                VStack(spacing: 24) {

                    LiquidNavigationBar(
                        title: viewModel.title
                    )

                    LiquidCard {

                        Label(
                            viewModel.nextWorship,
                            systemImage: "calendar"
                        )

                        Divider()

                        Label(
                            viewModel.location,
                            systemImage: "mappin.and.ellipse"
                        )

                    }

                }

                .padding(24)

            }

        }

    }

}

#Preview {

    WorshipView()

}