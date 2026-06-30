import SwiftUI

struct WorshipView: View {

    @State
    private var viewModel = WorshipViewModel()

    var body: some View {

        ZStack {

            MeshGradientBackground()

            ScrollView(.vertical, showsIndicators: false) {

                VStack(spacing: 24) {

                    LiquidLargeTitle(

                        title: viewModel.title,

                        subtitle: "예배 안내"

                    )

                    WorshipScheduleCard()

                    LiquidCard {

                        VStack(alignment: .leading, spacing: 16) {

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

                    Color.clear

                        .frame(height: 100)

                }

                .padding(.horizontal, 24)

                .padding(.top, 24)

            }

        }

    }

}

#Preview {

    WorshipView()

}