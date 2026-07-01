import SwiftUI

struct WorshipView: View {
    private let viewModel = WorshipViewModel()

    var body: some View {
        ZStack {
            MeshGradientBackground()

            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: AppSpacing.large) {
                    LiquidLargeTitle(
                        title: viewModel.title,
                        subtitle: "예배 안내"
                    )

                    WorshipScheduleCard()

                    LiquidCard {
                        VStack(alignment: .leading, spacing: AppSpacing.medium) {
                            Label(
                                viewModel.nextWorship,
                                systemImage: "calendar"
                            )

                            GlassDivider()

                            Label(
                                viewModel.location,
                                systemImage: "mappin.and.ellipse"
                            )
                        }
                    }
                    .id("worship-location")

                    Color.clear
                        .frame(minHeight: AppSpacing.section * 2)
                }
                .padding(.horizontal, AppSpacing.large)
                .padding(.top, AppSpacing.large)
            }
        }
    }
}

#Preview {

    WorshipView()

}