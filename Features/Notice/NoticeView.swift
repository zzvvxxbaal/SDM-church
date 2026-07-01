import SwiftUI

struct NoticeView: View {
    private let viewModel = NoticeViewModel()
    @State private var search = ""

    var body: some View {
        ZStack {
            MeshGradientBackground()

            ScrollView {
                LazyVStack(spacing: AppSpacing.large) {
                    LiquidLargeTitle(
                        title: "공지사항",
                        subtitle: "청년부 소식"
                    )

                    LiquidSearchBar(text: $search)

                    NoticeHeader()

                    ForEach(viewModel.notices) { notice in
                        NoticeCard(notice: notice)
                            .id(notice.id)
                    }
                }
                .padding(AppSpacing.large)
            }
        }
    }
}

#Preview {
    NoticeView()
}
