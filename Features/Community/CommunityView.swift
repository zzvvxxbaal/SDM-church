import SwiftUI

struct CommunityView: View {
    private let viewModel = CommunityViewModel()

    var body: some View {

    ZStack {

        MeshGradientBackground()

        ScrollView(.vertical, showsIndicators: false) {

            LazyVStack(
                spacing: 28
            ) {

                LiquidLargeTitle(

                    title: "공동체",

                    subtitle: "Community"

                )

                CommunitySummaryCard()

                SmallGroupCard()

                MinistryCard()

                CommunityMemberCard()

                Color.clear

                    .frame(height: 120)

            }

            .padding(.horizontal, 24)

            .padding(.top, 24)

        }

    }

}

#Preview {

    CommunityView()

}