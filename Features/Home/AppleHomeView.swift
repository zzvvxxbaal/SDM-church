import SwiftUI

struct AppleHomeView: View {
    @Environment(AppState.self) private var appState
    @State private var scrollOffset: CGFloat = 0

    private var isLargeTitle: Bool {
        scrollOffset < 50
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            MeshGradientBackground()

            ScrollView {
                LazyVStack(spacing: AppSpacing.none) {
                    VStack(alignment: .leading, spacing: AppSpacing.xsWide) {
                        Text("서대문교회")
                            .font(isLargeTitle ? AppFonts.largeTitle : AppFonts.title)
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)
                            .animation(.spring(response: 0.3, dampingFraction: 0.8), value: isLargeTitle)
                            .accessibilityAddTraits(.isHeader)

                        if isLargeTitle {
                            Text("청년부")
                                .font(AppFonts.headline)
                                .foregroundStyle(AppColors.textSecondary)
                                .lineLimit(1)
                                .minimumScaleFactor(0.85)
                                .transition(.opacity.combined(with: .scale(scale: 0.95)))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, AppSpacing.large)
                    .padding(.vertical, AppSpacing.large)
                    .id("apple-home-title")

                    LazyVStack(spacing: AppSpacing.large) {
                        GreetingSection(userName: "\(appState.userName)님", userInitials: String(appState.userName.prefix(1)))
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
                            LazyVStack(spacing: AppSpacing.medium) {
                                AttendanceCard()
                                PrayerSummaryCard()
                                WeeklyVerseCard()
                            }
                            .padding(.horizontal, AppSpacing.large)
                        }
                        .id("apple-home-more")
                    }
                    .padding(.vertical, AppSpacing.large)

                    Color.clear
                        .frame(minHeight: AppSpacing.section * 2 + AppSpacing.large)
                }
            }
            .onScrollGeometryChange(for: CGFloat.self, of: { $0.contentOffset.y }, initial: 0) { _, newValue in
                scrollOffset = newValue
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
        }
    }
}

#Preview {
    AppleHomeView()
        .environment(AppState())
}
