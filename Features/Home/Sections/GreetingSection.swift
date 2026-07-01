import SwiftUI

struct GreetingSection: View {
    let userName: String
    let userInitials: String

    var greeting: String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: Date())

        switch hour {
        case 5..<12:
            return "좋은 아침입니다"
        case 12..<17:
            return "좋은 오후입니다"
        case 17..<22:
            return "좋은 저녁입니다"
        default:
            return "안녕하세요"
        }
    }

    var body: some View {
        AppleSection {
            LiquidCard {
                HStack(spacing: AppSpacing.medium) {
                    VStack(alignment: .leading, spacing: AppSpacing.small) {
                        Text(greeting)
                            .font(AppFonts.subheadline)
                            .foregroundStyle(AppColors.textSecondary)
                            .lineLimit(1)
                            .minimumScaleFactor(0.85)

                        Text(userName)
                            .font(AppFonts.largeTitle)
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)
                    }

                    Spacer()

                    LiquidAvatar(initials: userInitials, size: 68)
                }
                .accessibilityElement(children: .combine)
                .accessibilityLabel("인사")
                .accessibilityValue("\(greeting), \(userName)")
            }
        }
    }
}

#Preview {
    GreetingSection(userName: "정현석님", userInitials: "정")
        .padding()
}
