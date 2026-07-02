import SwiftUI

struct WorshipView: View {
    private let viewModel = WorshipViewModel()

    var body: some View {

    ZStack {

        MeshGradientBackground()

        ScrollView(.vertical, showsIndicators: false) {

            LazyVStack(
                spacing: 28
            ) {

                LiquidLargeTitle(

                    title: "예배",

                    subtitle: "Worship"

                )

                WorshipScheduleCard()

                LiquidCard {

                    Label(

                        viewModel.location,

                        systemImage: "mappin.and.ellipse.fill"

                    )

                    Divider()

                    Label(

                        viewModel.nextWorship,

                        systemImage: "calendar"

                    )

                    Divider()

                    Label(

                        "청년부 예배",

                        systemImage: "person.3.fill"

                    )

                }

                HomeBanner()

                    .frame(height: 180)

                Color.clear

                    .frame(height: 120)

            }

            .padding(.horizontal, 24)

            .padding(.top, 24)

        }

    }

}

#Preview {

    WorshipView()

}