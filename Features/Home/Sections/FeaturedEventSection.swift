import SwiftUI

struct FeaturedEventSection: View {
    let title: String
    let date: String
    let time: String
    let location: String
    let description: String
    let rsvpCount: Int
    let maxAttendees: Int
    let isRegistered: Bool
    let onRegister: (() -> Void)?

    init(
        title: String = "청년 수련회",
        date: String = "2026년 7월 15일",
        time: String = "09:00 - 17:00",
        location: String = "계성산장",
        description: String = "한 해의 중반을 돌아보고 함께 기도하며 말씀을 묵상하는 시간입니다.",
        rsvpCount: Int = 45,
        maxAttendees: Int = 100,
        isRegistered: Bool = false,
        onRegister: (() -> Void)? = nil
    ) {
        self.title = title
        self.date = date
        self.time = time
        self.location = location
        self.description = description
        self.rsvpCount = rsvpCount
        self.maxAttendees = maxAttendees
        self.isRegistered = isRegistered
        self.onRegister = onRegister
    }

    private var occupancyPercentage: Double {
        guard maxAttendees > 0 else { return 0 }
        return Double(rsvpCount) / Double(maxAttendees)
    }

    var body: some View {
        AppleSection(title: "특별 행사", icon: "calendar.badge.exclamationmark", size: .large) {
            AppleFeaturedCard(
                title: title,
                icon: "calendar.badge.exclamationmark",
                backgroundColor: AppColors.warningSoft
            ) {
                VStack(alignment: .leading, spacing: AppSpacing.medium) {
                    Text(description)
                        .font(AppFonts.subheadline)
                        .foregroundStyle(AppColors.textSecondary)
                        .lineLimit(2)
                        .minimumScaleFactor(0.85)

                    VStack(alignment: .leading, spacing: AppSpacing.small) {
                        detailRow(icon: "calendar", text: date)
                        detailRow(icon: "clock", text: time)
                        detailRow(icon: "location", text: location)
                    }
                    .foregroundStyle(AppColors.textSecondary)

                    VStack(alignment: .leading, spacing: AppSpacing.small) {
                        HStack(spacing: AppSpacing.none) {
                            Text("참석 현황")
                                .font(AppFonts.caption1)

                            Spacer()

                            Text("\(rsvpCount) / \(maxAttendees)명")
                                .font(AppFonts.caption1)
                                .foregroundStyle(AppColors.textSecondary)
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                        }

                        LiquidProgress(value: occupancyPercentage)
                            .frame(height: AppSpacing.xSmall)
                            .accessibilityValue("\(rsvpCount)명 참석, 최대 \(maxAttendees)명")
                    }
                    .accessibilityElement(children: .combine)

                    if !isRegistered {
                        Button(action: { onRegister?() }) {
                            Text("참석하기")
                                .font(AppFonts.subheadline)
                        }
                        .buttonStyle(LiquidButton())
                        .frame(minHeight: AccessibilityHelper.minInteractiveSize)
                        .accessibilityLabel("참석하기")
                        .accessibilityHint("행사 참석을 등록합니다")
                        .accessibilityAddTraits(.isButton)
                    } else {
                        HStack(spacing: AppSpacing.small) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(AppFonts.subheadline)
                                .foregroundStyle(AppColors.success)
                                .accessibilityHidden(true)
                            Text("참석 확정")
                                .font(AppFonts.caption1)
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                        }
                        .frame(maxWidth: .infinity, minHeight: AccessibilityHelper.minInteractiveSize)
                        .background(AppColors.successSoft)
                        .cornerRadius(AppRadius.medium)
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("참석 상태")
                        .accessibilityValue("참석 확정")
                    }
                }
            }
        }
    }

    private func detailRow(icon: String, text: String) -> some View {
        HStack(spacing: AppSpacing.xSmall) {
            Image(systemName: icon)
                .font(AppFonts.caption1)
                .accessibilityHidden(true)
            Text(text)
                .font(AppFonts.caption1)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    FeaturedEventSection()
        .padding()
}
