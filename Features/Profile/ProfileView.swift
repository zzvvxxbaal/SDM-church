import SwiftUI

struct ProfileView: View {

    @State
    private var viewModel = ProfileViewModel()

    var body: some View {

        ZStack {

            AppColors.background
                .ignoresSafeArea()

            ScrollView {

                VStack(spacing: 24) {

                    LiquidNavigationBar(
                        title: "프로필"
                    )

                    LiquidAvatar(

                        initials: "정",

                        size: 110

                    )

                    LiquidCard {

                        Text(viewModel.name)

                            .font(AppFonts.title)

                        Text(viewModel.church)

                            .foregroundStyle(.secondary)

                        Text(viewModel.department)

                            .foregroundStyle(.secondary)

                    }

                }

                .padding(24)

            }

        }

    }

}

#Preview {

    ProfileView()

}