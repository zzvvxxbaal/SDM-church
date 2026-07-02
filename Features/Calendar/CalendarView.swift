import SwiftUI

struct CalendarView: View {
    private let viewModel = CalendarViewModel()

    var body: some View {

    ZStack {

        MeshGradientBackground()

        ScrollView(.vertical, showsIndicators: false) {

            LazyVStack(
                spacing: 28
            ) {

                LiquidLargeTitle(

                    title: "일정",

                    subtitle: "Calendar"

                )

                MonthlyCalendarCard()

                UpcomingScheduleCard()

                MonthlyEventList()

                Color.clear

                    .frame(height: 120)

            }

            .padding(.horizontal, 24)

            .padding(.top, 24)

        }

    }

}

#Preview {

    CalendarView()

}