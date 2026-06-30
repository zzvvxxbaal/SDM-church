import SwiftUI

struct ProfileView: View {

    @State

    private var viewModel = ProfileViewModel()

    var body: some View {

        ZStack {

            MeshGradientBackground()

            ScrollView {

                VStack(spacing: 24) {

                    LiquidLargeTitle(

                        title: "프로필",

                        subtitle: "내 정보"

                    )

                    LiquidAvatar(

                        initials: "정",

                        size: 110

                    )

                    LiquidCard {

                        Text(viewModel.name)

                            .font(.title.bold())

                        Text(viewModel.church)

                            .foregroundStyle(.secondary)

                        Text(viewModel.department)

                            .foregroundStyle(.secondary)

                    }

                    ProfileStatSection()

                    ProfileMenuSection()

                    Color.clear

                        .frame(height: 80)

                }

                .padding(24)

            }

        }

    }

}

#Preview {

    ProfileView()

}