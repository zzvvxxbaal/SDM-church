import SwiftUI

struct PrayerView: View {
    private let viewModel = PrayerViewModel()

    var body: some View {
        ZStack {
            AppColors.background
                .ignoresSafeArea()

            ScrollView {
                LazyVStack(spacing: AppSpacing.inset) {
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
                        .id(prayer)
                    }
                }
                .padding(AppSpacing.large)
            }
        }
    }
}

#Preview {

    PrayerView()

}