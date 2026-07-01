import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            MeshGradientBackground()

            ScrollView {
                LazyVStack(spacing: AppSpacing.large) {
                    LiquidLargeTitle(
                        title: "서대문교회",
                        subtitle: "청년부"
                    )
                    .id("home-title")

                    HomeHeader()
                    QuickMenu()
                    TodayVerseCard()
                    HomeBanner()
                    AttendanceCard()
                    UpcomingEventCard()
                    PrayerSummaryCard()
                    WeeklyVerseCard()
                    WorshipCountdownCard()
                    ChurchEventCard()
                    RecentNoticeCard()
                    WelcomeCard()
                    DevotionalCard()
                    MinistryCard()
                    OfferingCard()

                    HomeCard(
                        section: .init(
                            title: "이번 주 예배",
                            subtitle: "주일 오후 2:00",
                            icon: "church"
                        )
                    )
                    .id("home-card-worship")

                    HomeCard(
                        section: .init(
                            title: "공지사항",
                            subtitle: "새로운 공지가 있습니다.",
                            icon: "megaphone.fill"
                        )
                    )
                    .id("home-card-notice")

                    HomeCard(
                        section: .init(
                            title: "소그룹",
                            subtitle: "이번 주 모임을 확인하세요.",
                            icon: "person.3.fill"
                        )
                    )
                    .id("home-card-group")

                    Color.clear
                        .frame(minHeight: AppSpacing.section * 2 + AppSpacing.large)
                }
                .padding(.horizontal, AppSpacing.large)
                .padding(.top, AppSpacing.large)
            }

            FloatingGlassTabBar {
                Spacer()
                Image(systemName: "house.fill")
                    .accessibilityHidden(true)
                Spacer()
                Image(systemName: "calendar")
                    .accessibilityHidden(true)
                Spacer()
                Image(systemName: "hands.sparkles.fill")
                    .accessibilityHidden(true)
                Spacer()
                Image(systemName: "person.3.fill")
                    .accessibilityHidden(true)
                Spacer()
                Image(systemName: "gearshape.fill")
                    .accessibilityHidden(true)
                Spacer()
            }
            .padding(.horizontal, AppSpacing.inset)
            .padding(.bottom, AppSpacing.medium)
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Quick tab bar")
            .accessibilityHint("Displays the main navigation destinations")
        }
    }
}

#Preview {
    HomeView()
        .environment(AppState())
}
