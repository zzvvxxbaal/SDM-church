import SwiftUI

struct FeaturedAnnouncementSection: View {
    let title: String
    let category: String
    let date: String
    let preview: String
    let onTap: (() -> Void)?
    
    init(
        title: String = "여름 성경학교 안내",
        category: String = "공지사항",
        date: String = "2026년 6월 30일",
        preview: String = "올해 여름 성경학교는 7월 21일부터 25일까지 진행됩니다. 자세한 내용은 더 보기를 눌러주세요.",
        onTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.category = category
        self.date = date
        self.preview = preview
        self.onTap = onTap
    }
    
    var body: some View {
        AppleSection(
            title: "최신 공지",
            icon: "megaphone.fill",
            size: .large
        ) {
            Button(action: { onTap?() }) {
                AppleFeaturedCard(
                    title: title,
                    icon: "megaphone.fill",
                    backgroundColor: .red.opacity(0.1)
                ) {
                    VStack(alignment: .leading, spacing: AppSpacing.medium) {
                        HStack(spacing: AppSpacing.small) {
                            Label(category, systemImage: "tag.fill")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundStyle(AppColors.tint)
                                .padding(.horizontal, AppSpacing.small)
                                .padding(.vertical, 4)
                                .background(AppColors.tint.opacity(0.1))
                                .cornerRadius(AppRadius.small)
                            
                            Spacer()
                            
                            Text(date)
                                .font(.system(size: 12, weight: .regular))
                                .foregroundStyle(.secondary)
                        }
                        
                        Text(preview)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundStyle(.secondary)
                            .lineLimit(2)
                        
                        HStack(spacing: AppSpacing.xSmall) {
                            Text("더 보기")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(AppColors.tint)
                            
                            Image(systemName: "arrow.right")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundStyle(AppColors.tint)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    FeaturedAnnouncementSection()
        .padding()
}
