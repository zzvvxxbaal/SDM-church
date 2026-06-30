import SwiftUI

struct TodayVerseCard: View {

    var body: some View {

        LiquidCard {

            Label(

                "오늘의 말씀",

                systemImage: "book.closed.fill"

            )

            .font(.headline)

            Text("""
너희는 먼저 그의 나라와 그의 의를 구하라.
그리하면 이 모든 것을 너희에게 더하시리라.
""")

            .font(.body)

            Text("마태복음 6:33")

                .foregroundStyle(.secondary)

        }

    }

}