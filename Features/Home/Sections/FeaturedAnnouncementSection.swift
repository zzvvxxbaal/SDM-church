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
        AppleSection(title: "최신 공지", icon: "megaphone.fill", size: .large) {
            Button(action: { onTap?() }) {
                AppleFeaturedCard(
                    title: title,
                    icon: "megaphone.fill",
                    backgroundColor: AppColors.errorSoft
                ) {
                    VStack(alignment: .leading, spacing: AppSpacing.medium) {
                        HStack(spacing: AppSpacing.small) {
                            Label(category, systemImage: "tag.fill")
                                .font(.caption.weight(.semibold))
                                .foregroundStyle(AppColors.tint)
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                                .padding(.horizontal, AppSpacing.small)
                                .padding(.vertical, AppSpacing.xSmall)
                                .background(AppColors.tint.opacity(0.1))
                                .cornerRadius(AppRadius.small)

                            Spacer()

                            Text(date)
                                .font(AppFonts.caption1)
                                .foregroundStyle(AppColors.textSecondary)
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                        }

                        Text(preview)
                            .font(.subheadline)
                            .foregroundStyle(AppColors.textSecondary)
                            .lineLimit(2)
                            .minimumScaleFactor(0.85)

                        HStack(spacing: AppSpacing.xSmall) {
                            Text("더 보기")
                                .font(.subheadline.weight(.semibold))
                                .foregroundStyle(AppColors.tint)
                            Image(systemName: "arrow.right")
                                .font(.caption.weight(.semibold))
                                .foregroundStyle(AppColors.tint)
                                .accessibilityHidden(true)
                        }
                    }
                }
            }
            .accessibilityLabel(title)
            .accessibilityHint("공지 상세 화면을 엽니다")
            .accessibilityValue("\(category), \(date)")
            .accessibilityAddTraits(.isButton)
        }
    }
}

#Preview {
    FeaturedAnnouncementSection()
        .padding()
}
