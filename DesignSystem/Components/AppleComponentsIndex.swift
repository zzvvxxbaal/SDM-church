import SwiftUI

/// # Apple Home Experience Components Index
///
/// A comprehensive guide to the new Apple-style UI components for the SDM Church app.
///
/// ## Foundation Components
///
/// - `AppleSection`: Container for organizing content into Apple-style sections
/// - `AppleSectionHeader`: Customizable header with title, subtitle, icon, and "See All" button
/// - `SectionModel`: Data structure for defining section properties
/// - `SectionHeaderSize`: Enum for header size variants (large, medium, small)
///
/// ## Cards & Featured Content
///
/// - `AppleHeroCard`: Full-width featured card with gradient background and overlay
/// - `AppleFeaturedCard`: Medium-sized card with header and metadata
/// - `AppleExpandableCard`: Card that expands to reveal additional content
///
/// ## Sections (Ready-to-Use)
///
/// - `GreetingSection`: Time-aware greeting with user name and avatar
/// - `FeaturedVerseSection`: Daily Bible verse with sharing and bookmark actions
/// - `QuickActionsSection`: 4-item grid of quick access buttons
/// - `FeaturedWorshipSection`: Weekly worship details with registration
/// - `FeaturedAnnouncementSection`: Latest announcement with category
/// - `FeaturedEventSection`: Upcoming event with RSVP tracking
/// - `MinistrySection`: Horizontal carousel of ministry teams
/// - `RecentActivitySection`: Personalized activity feed
/// - `PersonalizedSummarySection`: Weekly statistics dashboard
///
/// ## Carousels
///
/// - `HorizontalCardCarousel`: Basic horizontal scrolling carousel
/// - `ResponsiveHorizontalCarousel`: Auto-width carousel based on items per view
/// - `CarouselWithIndicators`: Carousel with page indicators
///
/// ## States & Empty States
///
/// - `AppleEmptyState`: Consistent empty state with icon, title, and CTA
/// - `AppleLoadingState`: Skeleton loading with shimmer animation
///
/// ## Animations & Effects
///
/// - `AppleSpringAnimations`: Reusable spring presets (bouncy, smooth, snappy, gentle)
/// - `AppleContentTransition`: Predefined transitions (fadeScale, slideUp, blur)
/// - `ContentDepthEffect`: Floating content with depth perception
/// - `ParallaxScrollView`: Scroll view with parallax effects
/// - `StretchableHero`: Header that stretches when overscrolling
/// - `LargeTitleCollapse`: Animated collapse of large titles
/// - Scroll-based effects: blur, scale, opacity, parallax
///
/// ## Polish Components
///
/// - `FloatingCardEffect`: Hover effects with elevation
/// - `StatDisplay`: Statistics card with icon and label
/// - `InfoBlock`: Information block with action
/// - `CTARow`: Call-to-action row with trailing element
/// - `AppleBadge`: Category badge with optional icon
/// - `LabeledDivider`: Section divider with label
/// - `FloatingButtonModifier`: Floating animation for buttons
/// - `BounceEffect`: Bounce animation effect
/// - `ShineEffect`: Shimmer shine effect
///
/// ## Layout & Responsiveness
///
/// - `ResponsiveGrid`: Multi-column grid layout
/// - `AdaptiveText`: Text that scales with Dynamic Type
/// - `AdaptiveSpacing`: Spacing that adapts to accessibility
/// - `SafeAreaAwareContainer`: Container with safe area padding
/// - `AccessibleLabel`: Generic view with accessibility support
/// - `MotionReduceAnimation`: Respects motion reduce preference
/// - `SectionDivider`: Configurable section divider
///
/// ## Usage Examples
///
/// ### Creating a Section
///
/// ```swift
/// AppleSection(
///     title: "Featured Verse",
///     icon: "book.closed.fill",
///     size: .large,
///     showSeeAll: true,
///     seeAllAction: { /* handle tap */ }
/// ) {
///     // Section content here
///     FeaturedVerseSection(
///         verse: "John 3:16",
///         reference: "John 3:16"
///     )
/// }
/// ```
///
/// ### Creating a Carousel
///
/// ```swift
/// HorizontalCardCarousel(
///     items: ministryArray,
///     itemSpacing: AppSpacing.medium,
///     horizontalPadding: AppSpacing.large
/// ) { ministry in
///     MinistryCard(ministry: ministry)
/// }
/// ```
///
/// ### Using Animations
///
/// ```swift
/// Text("Animated Text")
///     .animation(.spring(response: 0.4, dampingFraction: 0.8), value: someValue)
///
/// // Or use preset
/// Button("Action") { }
///     .animation(AppleSpringAnimations.snappy, value: isActive)
/// ```
///
/// ### Responsive Grid
///
/// ```swift
/// ResponsiveGrid(
///     items: items,
///     columns: 2,
///     spacing: AppSpacing.medium
/// ) { item in
///     ItemCard(item: item)
/// }
/// ```
///
/// ## Main Home View
///
/// `AppleHomeView`: Complete home screen composing all sections in Apple-first design
///
/// ## Key Features
///
/// ✅ Apple-first design aesthetic
/// ✅ Full Dark Mode support
/// ✅ Dynamic Type support
/// ✅ Accessibility optimized
/// ✅ Smooth animations using proper springs
/// ✅ No hardcoded layout values
/// ✅ Reusable across screens
/// ✅ Production-ready code
/// ✅ Backward compatible with existing components

struct AppleComponentsDocumentation: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: AppSpacing.large) {
                Text("Apple Home Experience Components")
                    .font(.system(size: 28, weight: .bold))
                
                Text("Complete guide to all new Apple-style UI components for the SDM Church app")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(.secondary)
                
                // Foundation
                SectionDocumentation(
                    title: "Foundation Components",
                    items: [
                        "AppleSection - Section container",
                        "AppleSectionHeader - Customizable header",
                        "SectionModel - Data structure",
                        "SectionHeaderSize - Size variants"
                    ]
                )
                
                // Cards
                SectionDocumentation(
                    title: "Cards & Featured Content",
                    items: [
                        "AppleHeroCard - Full-width featured",
                        "AppleFeaturedCard - Medium featured",
                        "AppleExpandableCard - Expandable content"
                    ]
                )
                
                // Ready-to-use sections
                SectionDocumentation(
                    title: "Home Sections",
                    items: [
                        "GreetingSection - Time-aware greeting",
                        "FeaturedVerseSection - Daily verse",
                        "QuickActionsSection - Quick menu",
                        "FeaturedWorshipSection - Worship details",
                        "FeaturedAnnouncementSection - Latest news",
                        "FeaturedEventSection - Upcoming events",
                        "MinistrySection - Ministry carousel",
                        "RecentActivitySection - Activity feed",
                        "PersonalizedSummarySection - Statistics"
                    ]
                )
                
                // Animations
                SectionDocumentation(
                    title: "Animations & Effects",
                    items: [
                        "AppleSpringAnimations - Spring presets",
                        "ContentDepthEffect - Depth perception",
                        "StretchableHero - Stretchable header",
                        "LargeTitleCollapse - Title animation"
                    ]
                )
            }
            .padding(AppSpacing.large)
        }
    }
}

private struct SectionDocumentation: View {
    let title: String
    let items: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
            
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                ForEach(items, id: \.self) { item in
                    HStack(spacing: AppSpacing.small) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(AppColors.tint)
                        
                        Text(item)
                            .font(.system(size: 14, weight: .regular))
                    }
                }
            }
        }
        .padding(AppSpacing.medium)
        .liquidGlass(.card, cornerRadius: AppRadius.card)
    }
}

#Preview {
    AppleComponentsDocumentation()
}
