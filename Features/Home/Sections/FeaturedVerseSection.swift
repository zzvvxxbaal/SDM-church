import SwiftUI

struct FeaturedVerseSection: View {
    let verse: String
    let reference: String
    let translation: String?
    let onShare: (() -> Void)?
    let onBookmark: (() -> Void)?

    @State private var isBookmarked = false

    init(
        verse: String,
        reference: String,
        translation: String? = nil,
        onShare: (() -> Void)? = nil,
        onBookmark: (() -> Void)? = nil
    ) {
        self.verse = verse
        self.reference = reference
        self.translation = translation
        self.onShare = onShare
        self.onBookmark = onBookmark
    }

    var body: some View {
        AppleSection(title: "오늘의 말씀", icon: "book.closed.fill", size: .large) {
            AppleHeroCard(backgroundColor: AppColors.info) {
                VStack(alignment: .leading, spacing: AppSpacing.medium) {
                    VStack(alignment: .leading, spacing: AppSpacing.small) {
                        Text(verse)
                            .font(.headline)
                            .lineLimit(4)
                            .minimumScaleFactor(0.8)
                            .foregroundStyle(AppColors.textOnTint)

                        Text(reference)
                            .font(.subheadline)
                            .foregroundStyle(AppColors.textOnTint.opacity(0.8))
                            .lineLimit(1)
                            .minimumScaleFactor(0.8)

                        if let translation {
                            Text(translation)
                                .font(AppFonts.caption1)
                                .foregroundStyle(AppColors.textOnTint.opacity(0.7))
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                        }
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("오늘의 말씀")
                    .accessibilityValue("\(verse), \(reference)")

                    Spacer()

                    HStack(spacing: AppSpacing.medium) {
                        Button(action: { onShare?() }) {
                            Image(systemName: "square.and.arrow.up")
                                .font(.headline)
                                .foregroundStyle(AppColors.textOnTint)
                                .frame(width: AccessibilityHelper.minInteractiveSize, height: AccessibilityHelper.minInteractiveSize)
                                .background(AppColors.glass)
                                .clipShape(Circle())
                        }
                        .accessibilityLabel("공유")
                        .accessibilityHint("말씀을 공유합니다")
                        .accessibilityAddTraits(.isButton)

                        Button(action: {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                isBookmarked.toggle()
                            }
                            onBookmark?()
                        }) {
                            Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                                .font(.headline)
                                .foregroundStyle(AppColors.textOnTint)
                                .frame(width: AccessibilityHelper.minInteractiveSize, height: AccessibilityHelper.minInteractiveSize)
                                .background(isBookmarked ? AppColors.glassHighlight : AppColors.glass)
                                .clipShape(Circle())
                        }
                        .accessibilityLabel("북마크")
                        .accessibilityHint("말씀을 저장합니다")
                        .accessibilityValue(isBookmarked ? "저장됨" : "저장 안 됨")
                        .accessibilityAddTraits(.isButton)

                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    FeaturedVerseSection(
        verse: "너희는 먼저 그의 나라와 그의 의를 구하라. 그리하면 이 모든 것을 너희에게 더하시리라.",
        reference: "마태복음 6:33",
        translation: "Matthew 6:33"
    )
    .padding()
}
