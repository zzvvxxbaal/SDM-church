import SwiftUI

struct AppleHomeView: View {
    @State private var scrollOffset: CGFloat = 0
    @State private var largeTitle = true
    
    var body: some View {
        ZStack(alignment: .bottom) {
            MeshGradientBackground()
            
            ScrollView {
                VStack(spacing: 0) {
                    // Large Title with scroll behavior
                    VStack(alignment: .leading, spacing: 6) {
                        Text("서대문교회")
                            .font(.system(size: largeTitle ? 42 : 28, weight: .bold))
                            .animation(.spring(response: 0.3, dampingFraction: 0.8), value: largeTitle)
                        
                        if largeTitle {
                            Text("청년부")
                                .font(.headline)
                                .foregroundStyle(.secondary)
                                .transition(.opacity.combined(with: .scale(scale: 0.95)))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, AppSpacing.large)
                    .padding(.vertical, AppSpacing.large)
                    
                    VStack(spacing: AppSpacing.large) {
                        // Greeting Section
                        GreetingSection(
                            userName: "정현석님",
                            userInitials: "정"
                        )
                        
                        // Featured Verse
                        FeaturedVerseSection(
                            verse: "너희는 먼저 그의 나라와 그의 의를 구하라. 그리하면 이 모든 것을 너희에게 더하시리라.",
                            reference: "마태복음 6:33",
                            translation: "Matthew 6:33"
                        )
                        
                        // Quick Actions
                        QuickActionsSection()
                        
                        // Featured Worship
                        FeaturedWorshipSection(
                            attendees: 132,
                            isRegistered: true
                        )
                        
                        // Featured Announcement
                        FeaturedAnnouncementSection()
                        
                        // Featured Event
                        FeaturedEventSection(
                            rsvpCount: 47,
                            isRegistered: false
                        )
                        
                        // Ministry Section
                        MinistrySection()
                        
                        // Recent Activity
                        RecentActivitySection()
                        
                        // Personalized Summary
                        PersonalizedSummarySection()
                        
                        // Preserved Legacy Cards
                        AppleSection(
                            title: "더보기",
                            size: .medium
                        ) {
                            VStack(spacing: AppSpacing.medium) {
                                // Attendance Card (wrapped)
                                AttendanceCard()
                                
                                // Prayer Summary (wrapped)
                                PrayerSummaryCard()
                                
                                // Weekly Verse (wrapped)
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
            .onScrollGeometryChange(
                for: CGFloat.self,
                of: { geometry in
                    geometry.contentOffset.y
                },
                initial: 0
            ) { _, newValue in
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
            .padding(.horizontal, 20)
            .padding(.bottom, 16)
        }
    }
}

#Preview {
    AppleHomeView()
}
