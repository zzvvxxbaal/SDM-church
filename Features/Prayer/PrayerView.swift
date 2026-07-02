import SwiftUI

struct PrayerView: View {
    private let viewModel = PrayerViewModel()

    var body: some View {

    ZStack {

        MeshGradientBackground()

        ScrollView(.vertical, showsIndicators: false) {

            LazyVStack(
                spacing: 28
            ) {

                LiquidLargeTitle(

                    title: "기도",

                    subtitle: "Prayer"

                )

                PrayerSummaryCard()

                ForEach(viewModel.prayers) { prayer in

                    PrayerCard(
                        prayer: prayer
                    )

                }

                Color.clear

                    .frame(height: 120)

            }

            .padding(.horizontal, 24)

            .padding(.top, 24)

        }

    }

}

#Preview {

    PrayerView()

}