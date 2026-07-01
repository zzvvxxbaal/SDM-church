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
    
    var occupancyPercentage: Double {
        Double(rsvpCount) / Double(maxAttendees)
    }
    
    var body: some View {
        AppleSection(
            title: "특별 행사",
            icon: "calendar.badge.exclamationmark",
            size: .large
        ) {
            AppleFeaturedCard(
                title: title,
                icon: "calendar.badge.exclamationmark",
                backgroundColor: .orange.opacity(0.1)
            ) {
                VStack(alignment: .leading, spacing: AppSpacing.medium) {
                    Text(description)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                    
                    VStack(alignment: .leading, spacing: AppSpacing.small) {
                        HStack(spacing: AppSpacing.xSmall) {
                            Image(systemName: "calendar")
                                .font(.system(size: 12, weight: .semibold))
                            Text(date)
                                .font(.system(size: 12, weight: .semibold))
                        }
                        
                        HStack(spacing: AppSpacing.xSmall) {
                            Image(systemName: "clock")
                                .font(.system(size: 12, weight: .semibold))
                            Text(time)
                                .font(.system(size: 12, weight: .semibold))
                        }
                        
                        HStack(spacing: AppSpacing.xSmall) {
                            Image(systemName: "location")
                                .font(.system(size: 12, weight: .semibold))
                            Text(location)
                                .font(.system(size: 12, weight: .semibold))
                        }
                    }
                    .foregroundStyle(.secondary)
                    
                    VStack(alignment: .leading, spacing: AppSpacing.small) {
                        HStack(justifyContent: .spaceBetween) {
                            Text("참석 현황")
                                .font(.system(size: 12, weight: .semibold))
                            
                            Text("\(rsvpCount) / \(maxAttendees)명")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundStyle(.secondary)
                        }
                        
                        LiquidProgress(value: occupancyPercentage)
                            .frame(height: 4)
                    }
                    
                    if !isRegistered {
                        Button(action: { onRegister?() }) {
                            Text("참석하기")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .buttonStyle(LiquidButton())
                        .frame(height: 40)
                    } else {
                        HStack(spacing: AppSpacing.small) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(.green)
                            Text("참석 확정")
                                .font(.system(size: 13, weight: .semibold))
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(AppRadius.medium)
                    }
                }
            }
        }
    }
}

extension HStack {
    init(justifyContent: VerticalAlignment, @ViewBuilder content: () -> some View) {
        self.init(alignment: justifyContent, spacing: nil, content: content)
    }
}

#Preview {
    FeaturedEventSection()
        .padding()
}
