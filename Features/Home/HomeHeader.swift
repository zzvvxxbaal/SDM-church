import SwiftUI

struct HomeHeader: View {
    var body: some View {
        LiquidCard {
            HStack {
                VStack(alignment: .leading, spacing: AppSpacing.small) {
                    Text("좋은 오후입니다")
                        .font(.headline)
                        .foregroundStyle(AppColors.textSecondary)

                    Text("정현석님")
                        .font(.largeTitle.weight(.bold))
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                }

                Spacer()

                LiquidAvatar(
                    initials: "정",
                    size: 72
                )
            }
        }
    }
}
