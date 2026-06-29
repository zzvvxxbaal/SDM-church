import SwiftUI

struct CommunityView: View {

    @State
    private var viewModel = CommunityViewModel()

    var body: some View {

        ZStack {

            AppColors.background
                .ignoresSafeArea()

            ScrollView {

                VStack(spacing: 20) {

                    LiquidNavigationBar(
                        title: "소그룹"
                    )

                    ForEach(viewModel.groups, id: \.self) { group in

                        LiquidCard {

                            Label(

                                group,

                                systemImage: "person.3.fill"

                            )

                        }

                    }

                }

                .padding(24)

            }

        }

    }

}

#Preview {

    CommunityView()

}