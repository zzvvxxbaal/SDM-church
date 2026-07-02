import SwiftUI

struct NoticeView: View {
    private let viewModel = NoticeViewModel()
    @State private var search = ""

    var body: some View {

    ZStack {

        MeshGradientBackground()

        ScrollView(.vertical, showsIndicators: false) {

            LazyVStack(
                spacing: 28
            ) {

                LiquidLargeTitle(

                    title: "공지사항",

                    subtitle: "Notice"

                )

                LiquidSearchBar(
                    text: $viewModel.searchText
                )

                ForEach(viewModel.notices) { notice in

                    NoticeCard(
                        notice: notice
                    )

                }

                Color.clear

                    .frame(height: 120)

            }

            .padding(.horizontal, 24)

            .padding(.top, 24)

        }

    }

}

#Preview {
    NoticeView()
}
