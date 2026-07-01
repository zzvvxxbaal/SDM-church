import SwiftUI

struct WeeklyVerseCard: View {

    var body: some View {

        LiquidCard {

            VStack(alignment: .leading, spacing: AppSpacing.medium) {

                Label(

                    "이번 주 말씀",

                    systemImage: "book.closed.fill"

                )
                .font(.headline)

                Text("""
믿음은 바라는 것들의 실상이요
보이지 않는 것들의 증거니
""")

                .font(.title3.weight(.medium))

                Text("히브리서 11:1")

                    .foregroundStyle(.secondary)

            }

        }

    }

}