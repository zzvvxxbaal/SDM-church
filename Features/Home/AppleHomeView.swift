import SwiftUI

struct AppleHomeView: View {
    @State private var scrollOffset: CGFloat = 0
    @State private var largeTitle = true

    var body: some View {
        ZStack(alignment: .bottom) {
            MeshGradientBackground()

            ScrollView {
                VStack(spacing: AppSpacing.none) {
                    VStack(alignment: .leading, spacing: AppSpacing.xsWide) {
                        Text("서대문교회")
                            .font(largeTitle ? AppFonts.largeTitle : AppFonts.title)
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)
                            .animation(.spring(response: 0.3, dampingFraction: 0.8), value: largeTitle)
                            .accessibilityAddTraits(.isHeader)

                        if largeTitle {
                            Text("청년부")
                                .font(.headline)
                                .foregroundStyle(AppColors.textSecondary)
                                .lineLimit(1)
                                .minimumScaleFactor(0.85)
                                .transition(.opacity.combined(with: .scale(scale: 0.95)))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, AppSpacing.large)
                    .padding(.vertical, AppSpacing.large)

                    VStack(spacing: AppSpacing.large) {
                        GreetingSection(userName: "정현석님", userInitials: "정")
                        FeaturedVerseSection(
                            verse: "너희는 먼저 그의 나라와 그의 의를 구하라. 그리하면 이 모든 것을 너희에게 더하시리라.",
                            reference: "마태복음 6:33",
                            translation: "Matthew 6:33"
                        )
                        QuickActionsSection()
                        FeaturedWorshipSection(attendees: 132, isRegistered: true)
                        FeaturedAnnouncementSection()
                        FeaturedEventSection(rsvpCount: 47, isRegistered: false)
                        MinistrySection()
                        RecentActivitySection()
                        PersonalizedSummarySection()

                        AppleSection(title: "더보기", size: .medium) {
                            VStack(spacing: AppSpacing.medium) {
                                AttendanceCard()
                                PrayerSummaryCard()
                                WeeklyVerseCard()
                            }
                            .padding(.horizontal, AppSpacing.large)
                        }
                    }
                    .padding(.vertical, AppSpacing.large)

                    Color.clear
                        .frame(height: 120)
                }
            }
            .onScrollGeometryChange(for: CGFloat.self, of: { $0.contentOffset.y }, initial: 0) { _, newValue in
                scrollOffset = newValue
                largeTitle = scrollOffset < 50
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
            .padding(.horizontal, AppSpacing.inset)
            .padding(.bottom, AppSpacing.medium)
        }
    }
}

#Preview {
    AppleHomeView()
}
