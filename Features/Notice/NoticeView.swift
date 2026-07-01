import SwiftUI

struct NoticeView: View {
    @State private var viewModel = NoticeViewModel()
    @State private var search = ""

    var body: some View {
        ZStack {
            MeshGradientBackground()

            ScrollView {
                VStack(spacing: AppSpacing.large) {
                    LiquidLargeTitle(
                        title: "공지사항",
                        subtitle: "청년부 소식"
                    )

                    LiquidSearchBar(text: $search)

                    NoticeHeader()

                    ForEach(viewModel.notices) {
                        NoticeCard(notice: $0)
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
