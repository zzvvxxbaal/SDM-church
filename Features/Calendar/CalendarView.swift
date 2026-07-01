import SwiftUI

struct CalendarView: View {
    private let viewModel = CalendarViewModel()

    var body: some View {
        ZStack {
            MeshGradientBackground()

            ScrollView {
                LazyVStack(spacing: AppSpacing.large) {
                    LiquidLargeTitle(
                        title: "일정",
                        subtitle: "이번 주"
                    )
                    CalendarMonthHeader()

                    ForEach(viewModel.events) { event in
                        EventCard(event: event)
                            .id(event.id)
                    }
                }
                .padding(AppSpacing.large)
            }
        }
    }
}

#Preview {

    CalendarView()

}