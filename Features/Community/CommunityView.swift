import SwiftUI

struct CommunityView: View {
    private let viewModel = CommunityViewModel()

    var body: some View {
        ZStack {
            AppColors.background
                .ignoresSafeArea()

            ScrollView {
                LazyVStack(spacing: AppSpacing.inset) {
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
                        .id(group)
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