import SwiftUI

struct NoticeDetailView: View {

    let notice: Notice

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 24) {

                LiquidLargeTitle(

                    title: notice.title,

                    subtitle: notice.date

                )

                LiquidCard {

                    Text(notice.summary)

                        .font(.body)

                }

            }

            .padding(24)

        }

        .background(

            MeshGradientBackground()

        )

    }

}

#Preview {

    NoticeDetailView(

        notice: .init(

            title: "여름수련회",

            summary: "내용",

            date: "6월 30일",

            isPinned: true

        )

    )

}