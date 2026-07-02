import SwiftUI

struct ProfileView: View {
    private let viewModel = ProfileViewModel()

    var body: some View {

    ZStack {

        MeshGradientBackground()

        ScrollView(.vertical, showsIndicators: false) {

            LazyVStack(
                spacing: 28
            ) {

                LiquidLargeTitle(

                    title: "내 정보",

                    subtitle: "Profile"

                )

                ProfileHeaderCard()

                AttendanceCard()

                ServingCard()

                AccountCard()

                Color.clear

                    .frame(height: 120)

            }

            .padding(.horizontal, 24)

            .padding(.top, 24)

        }

    }

}

#Preview {

    ProfileView()

}