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
        AppleSection(
            title: "오늘의 말씀",
            icon: "book.closed.fill",
            size: .large
        ) {
            AppleHeroCard(backgroundColor: .blue) {
                VStack(alignment: .leading, spacing: AppSpacing.medium) {
                    VStack(alignment: .leading, spacing: AppSpacing.small) {
                        Text(verse)
                            .font(.system(size: 18, weight: .semibold))
                            .lineLimit(4)
                            .foregroundStyle(.white)
                        
                        Text(reference)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundStyle(.white.opacity(0.8))
                        
                        if let translation = translation {
                            Text(translation)
                                .font(.system(size: 12, weight: .regular))
                                .foregroundStyle(.white.opacity(0.7))
                        }
                    }
                    
                    Spacer()
                    
                    HStack(spacing: AppSpacing.medium) {
                        Button(action: { onShare?() }) {
                            Image(systemName: "square.and.arrow.up")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.white)
                                .frame(width: 44, height: 44)
                                .background(Color.white.opacity(0.2))
                                .clipShape(Circle())
                        }
                        
                        Button(action: {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                isBookmarked.toggle()
                            }
                            onBookmark?()
                        }) {
                            Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.white)
                                .frame(width: 44, height: 44)
                                .background(Color.white.opacity(isBookmarked ? 0.3 : 0.2))
                                .clipShape(Circle())
                        }
                        
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
