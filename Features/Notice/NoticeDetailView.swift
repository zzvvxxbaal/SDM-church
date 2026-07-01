import SwiftUI

struct NoticeDetailView: View {

    let notice: Notice

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: AppSpacing.large) {

                LiquidLargeTitle(

                    title: notice.title,

                    subtitle: notice.date

                )

                LiquidCard {

                    Text(notice.summary)

                        .font(AppFonts.body)

                }

            }

            .padding(AppSpacing.large)

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