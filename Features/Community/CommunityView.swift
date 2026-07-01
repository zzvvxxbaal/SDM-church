import SwiftUI

struct CommunityView: View {

    @State
    private var viewModel = CommunityViewModel()

    var body: some View {

        ZStack {

            AppColors.background
                .ignoresSafeArea()

            ScrollView {

                VStack(spacing: AppSpacing.inset) {

                    LiquidNavigationBar(
                        title: "소그룹"
                    )
                    
                     LeaderCard()

                    ForEach(viewModel.groups, id: \.self) { group in

                        LiquidCard {

                            Label(

                                group,

                                systemImage: "person.3.fill"

                            )

                        }

                    }

                }

                .padding(AppSpacing.large)

            }

        }

    }

}

#Preview {

    CommunityView()

}