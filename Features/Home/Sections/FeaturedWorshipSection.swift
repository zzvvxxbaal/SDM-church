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
        AppleSection(
            title: "이번 주 예배",
            icon: "church.fill",
            size: .large
        ) {
            AppleFeaturedCard(
                title: title,
                icon: "church.fill",
                backgroundColor: .blue.opacity(0.1)
            ) {
                VStack(alignment: .leading, spacing: AppSpacing.medium) {
                    HStack(spacing: AppSpacing.medium) {
                        VStack(alignment: .leading, spacing: AppSpacing.xSmall) {
                            HStack(spacing: AppSpacing.xSmall) {
                                Image(systemName: "calendar")
                                    .font(.system(size: 13, weight: .semibold))
                                Text(day)
                                    .font(.system(size: 13, weight: .semibold))
                            }
                            
                            HStack(spacing: AppSpacing.xSmall) {
                                Image(systemName: "clock.fill")
                                    .font(.system(size: 13, weight: .semibold))
                                Text(time)
                                    .font(.system(size: 13, weight: .semibold))
                            }
                            
                            HStack(spacing: AppSpacing.xSmall) {
                                Image(systemName: "location.fill")
                                    .font(.system(size: 13, weight: .semibold))
                                Text(location)
                                    .font(.system(size: 13, weight: .semibold))
                            }
                        }
                        .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: AppSpacing.xSmall) {
                            Text("\(attendees)")
                                .font(.system(size: 20, weight: .bold))
                            Text("참석 예정")
                                .font(.system(size: 12, weight: .regular))
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                    if !isRegistered {
                        Button(action: { onRegister?() }) {
                            Text("등록하기")
                                .font(.system(size: 16, weight: .semibold))
                        }
                        .buttonStyle(LiquidButton())
                        .frame(height: 44)
                    } else {
                        HStack(spacing: AppSpacing.small) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.green)
                            
                            Text("등록되었습니다")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(.green)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(AppRadius.button)
                    }
                }
            }
        }
    }
}

#Preview {
    FeaturedWorshipSection()
        .padding()
}
