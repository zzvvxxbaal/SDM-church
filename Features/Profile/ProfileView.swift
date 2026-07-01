import SwiftUI

struct ProfileView: View {
    private let viewModel = ProfileViewModel()

    var body: some View {
        ZStack {
            MeshGradientBackground()

            ScrollView {
                LazyVStack(spacing: AppSpacing.large) {
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
                            .font(AppFonts.title)

                        Text(viewModel.church)
                            .foregroundStyle(.secondary)

                        Text(viewModel.department)
                            .foregroundStyle(.secondary)
                    }
                    .id("profile-summary")

                    ProfileStatSection()
                    ProfileMenuSection()

                    Color.clear
                        .frame(minHeight: AppSpacing.floating * 2)
                }
                .padding(AppSpacing.large)
            }
        }
    }
}

#Preview {

    ProfileView()

}