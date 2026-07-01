import SwiftUI

struct FeaturedWorshipSection: View {
    let title: String
    let day: String
    let time: String
    let location: String
    let attendees: Int
    let isRegistered: Bool
    let onRegister: (() -> Void)?

    init(
        title: String = "주일 예배",
        day: String = "주일",
        time: String = "14:00",
        location: String = "청년부",
        attendees: Int = 120,
        isRegistered: Bool = false,
        onRegister: (() -> Void)? = nil
    ) {
        self.title = title
        self.day = day
        self.time = time
        self.location = location
        self.attendees = attendees
        self.isRegistered = isRegistered
        self.onRegister = onRegister
    }

    var body: some View {
        AppleSection(title: "이번 주 예배", icon: "church.fill", size: .large) {
            AppleFeaturedCard(
                title: title,
                icon: "church.fill",
                backgroundColor: AppColors.infoSoft
            ) {
                VStack(alignment: .leading, spacing: AppSpacing.medium) {
                    HStack(spacing: AppSpacing.medium) {
                        VStack(alignment: .leading, spacing: AppSpacing.xSmall) {
                            detailRow(icon: "calendar", text: day)
                            detailRow(icon: "clock.fill", text: time)
                            detailRow(icon: "location.fill", text: location)
                        }
                        .foregroundStyle(AppColors.textSecondary)

                        Spacer()

                        VStack(alignment: .trailing, spacing: AppSpacing.xSmall) {
                            Text("\(attendees)")
                                .font(AppFonts.title3)
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                            Text("참석 예정")
                                .font(AppFonts.caption1)
                                .foregroundStyle(AppColors.textSecondary)
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("참석 예정")
                        .accessibilityValue("\(attendees)명")
                    }

                    if !isRegistered {
                        Button(action: { onRegister?() }) {
                            Text("등록하기")
                                .font(.headline)
                        }
                        .buttonStyle(LiquidButton())
                        .frame(height: AccessibilityHelper.minInteractiveSize)
                        .accessibilityLabel("등록하기")
                        .accessibilityHint("이번 주 예배 참석을 등록합니다")
                        .accessibilityAddTraits(.isButton)
                    } else {
                        HStack(spacing: AppSpacing.small) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.headline)
                                .foregroundStyle(AppColors.success)
                                .accessibilityHidden(true)

                            Text("등록되었습니다")
                                .font(.subheadline.weight(.semibold))
                                .foregroundStyle(AppColors.success)
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: AccessibilityHelper.minInteractiveSize)
                        .background(AppColors.successSoft)
                        .cornerRadius(AppRadius.button)
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel("등록 상태")
                        .accessibilityValue("등록되었습니다")
                    }
                }
            }
        }
    }

    private func detailRow(icon: String, text: String) -> some View {
        HStack(spacing: AppSpacing.xSmall) {
            Image(systemName: icon)
                .font(.caption.weight(.semibold))
                .accessibilityHidden(true)
            Text(text)
                .font(.caption.weight(.semibold))
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    FeaturedWorshipSection()
        .padding()
}
