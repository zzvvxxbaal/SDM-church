import SwiftUI

struct QuickMenu: View {

    var body: some View {

        HStack {

            menu(

                "book.fill",

                "말씀"

            )

            Spacer()

            menu(

                "calendar",

                "일정"

            )

            Spacer()

            menu(

                "hands.sparkles.fill",

                "기도"

            )

            Spacer()

            menu(

                "person.3.fill",

                "모임"

            )

        }

    }

    @ViewBuilder

    private func menu(

        _ image: String,

        _ title: String

    ) -> some View {

        VStack(spacing: AppSpacing.compact) {

            ZStack {

                Circle()

                    .frame(

                        width: 62,

                        height: 62

                    )

                    .glass()

                Image(systemName: image)

                    .font(.title3)

            }

            Text(title)

                .font(.caption)

        }

    }

}