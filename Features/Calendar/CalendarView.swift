import SwiftUI

struct CalendarView: View {

    @State

    private var viewModel = CalendarViewModel()

    var body: some View {

        ZStack {

            MeshGradientBackground()

            ScrollView {

                VStack(spacing: 24) {

                    LiquidLargeTitle(

                        title: "일정",

                        subtitle: "이번 주"

                    )
                    
                     CalendarMonthHeader()

                    ForEach(viewModel.events) {

                        EventCard(

                            event: $0

                        )

                    }

                }

                .padding(24)

            }

        }

    }

}

#Preview {

    CalendarView()

}