import SwiftUI

struct HomeView: View {

    @State
    private var viewModel = HomeViewModel()

    @State
    private var tabSelection = 0

    var body: some View {

        ZStack(alignment: .bottom) {

            AppColors.background

                .ignoresSafeArea()

            ScrollView(.vertical, showsIndicators: false) {

                VStack(spacing: 24) {

                    LiquidNavigationBar(
                        title: "서대문교회"
                    )

                    LiquidCard {

                        HStack {

                            VStack(alignment: .leading, spacing: 6) {

                                Text("안녕하세요")

                                    .font(AppFonts.body)

                                    .foregroundStyle(.secondary)

                                Text("정현석님")

                                    .font(AppFonts.hero)

                            }

                            Spacer()

                            LiquidAvatar(
                                initials: "정"
                            )

                        }

                    }

                    ForEach(viewModel.sections) { section in

                        HomeCard(
                            section: section
                        )

                    }

                    Color.clear
                        .frame(height: 120)

                }

                .padding(.horizontal,24)

                .padding(.top,20)

            }

            LiquidTabBar(
                selection: $tabSelection
            )
            .padding(.horizontal,20)
            .padding(.bottom,20)

        }

    }

}

#Preview {

    HomeView()

}