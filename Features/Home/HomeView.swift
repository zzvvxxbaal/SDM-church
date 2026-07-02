import SwiftUI

struct HomeView: View {
    var body: some View {

    ZStack(alignment: .bottom) {

        MeshGradientBackground()

        ScrollView(.vertical, showsIndicators: false) {

            LazyVStack(
                spacing: 28,
                pinnedViews: []
            ) {

                LiquidLargeTitle(

                    title: "서대문교회",

                    subtitle: "청년부"

                )

                HomeHeader()

                QuickMenu()

                TodayVerseCard()

                HomeBanner()

                HomeCard(

                    section: .init(

                        title: "이번 주 예배",

                        subtitle: "주일 오후 2:00",

                        icon: "church"

                    )

                )

                HomeCard(

                    section: .init(

                        title: "공지사항",

                        subtitle: "새로운 공지가 있습니다.",

                        icon: "megaphone.fill"

                    )

                )

                HomeCard(

                    section: .init(

                        title: "소그룹",

                        subtitle: "이번 주 모임을 확인하세요.",

                        icon: "person.3.fill"

                    )

                )

                Color.clear

                    .frame(height: 120)

            }

            .padding(.horizontal, 24)

            .padding(.top, 24)

            .padding(.bottom, 12)

        }

        FloatingGlassTabBar {

            Spacer()

            Image(systemName: "house.fill")

                .font(.title3.weight(.semibold))

            Spacer()

            Image(systemName: "calendar")

                .font(.title3.weight(.semibold))

            Spacer()

            Image(systemName: "hands.sparkles.fill")

                .font(.title3.weight(.semibold))

            Spacer()

            Image(systemName: "person.3.fill")

                .font(.title3.weight(.semibold))

            Spacer()

            Image(systemName: "gearshape.fill")

                .font(.title3.weight(.semibold))

            Spacer()

        }

    }

}

#Preview {
    HomeView()
        .environment(AppState())
}
