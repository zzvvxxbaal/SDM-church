import SwiftUI

struct PrayerView: View {

    @State
    private var viewModel = PrayerViewModel()

    var body: some View {

        ZStack {

            AppColors.background
                .ignoresSafeArea()

            ScrollView {

                VStack(spacing: 20) {

                    LiquidNavigationBar(
                        title: "기도"
                    )

                     PrayerInputCard()

                    ForEach(viewModel.prayers, id: \.self) { prayer in

                        LiquidCard {

                            Label(

                                prayer,

                                systemImage: "hands.sparkles.fill"

                            )

                        }

                    }

                }

                .padding(24)

            }

        }

    }

}

#Preview {

    PrayerView()

}