import SwiftUI

struct HomeView: View {

    @State
    private var tab = 0

    var body: some View {

        ZStack(alignment: .bottom) {

            MeshGradientBackground()

            ScrollView {

                VStack(spacing: 24) {

                    LiquidLargeTitle(

                        title: "서대문교회",

                        subtitle: "청년부"

                    )

                    HomeHeader()

                    QuickMenu()

                    TodayVerseCard()

                    HomeBanner()
                    
                     AttendanceCard()

                     UpcomingEventCard()

                     PrayerSummaryCard()

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

            }

            FloatingGlassTabBar {

                Spacer()

                Image(systemName: "house.fill")

                Spacer()

                Image(systemName: "calendar")

                Spacer()

                Image(systemName: "hands.sparkles.fill")

                Spacer()

                Image(systemName: "person.3.fill")

                Spacer()

                Image(systemName: "gearshape.fill")

                Spacer()

            }

            .padding(.horizontal, 20)

            .padding(.bottom, 16)

        }

    }

}

#Preview {

    HomeView()

}