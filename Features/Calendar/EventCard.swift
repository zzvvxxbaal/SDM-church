import SwiftUI

struct EventCard: View {

    let event: CalendarEvent

    var body: some View {

        LiquidCard {

            VStack(alignment: .leading, spacing: AppSpacing.compact) {

                Text(event.title)

                    .font(AppFonts.headline)

                HStack {

                    Label(

                        event.time,

                        systemImage: "clock"

                    )

                    Spacer()

                    Label(

                        event.place,

                        systemImage: "mappin"

                    )

                }

                .foregroundStyle(.secondary)

            }

        }

    }

}