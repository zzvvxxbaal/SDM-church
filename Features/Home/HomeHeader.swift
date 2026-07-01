import SwiftUI

struct HomeHeader: View {
    @Environment(AppState.self) private var appState

    private var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())

        switch hour {
        case 5..<12: return "좋은 아침입니다"
        case 12..<17: return "좋은 오후입니다"
        case 17..<22: return "좋은 저녁입니다"
        default: return "안녕하세요"
        }
    }

    var body: some View {
        LiquidCard {
            HStack {
                VStack(alignment: .leading, spacing: AppSpacing.small) {
                    Text(greeting)
                        .font(AppFonts.headline)
                        .foregroundStyle(AppColors.textSecondary)

                    Text("\(appState.userName)님")
                        .font(AppFonts.largeTitle)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                }

                Spacer()

                LiquidAvatar(
                    initials: String(appState.userName.prefix(1)),
                    size: 72
                )
            }
        }
    }
}
