import SwiftUI

struct HomeHeader: View {

    var body: some View {

        HStack(spacing: 20) {

            VStack(
                alignment: .leading,
                spacing: 8
            ) {

                Text("좋은 오후입니다.")

                    .font(AppFonts.title3)

                    .foregroundStyle(
                        AppColors.textSecondary
                    )

                Text("정현석 청년")

                    .font(AppFonts.largeTitle)

                    .fontWeight(.bold)

                    .foregroundStyle(
                        AppColors.textPrimary
                    )

                Text("오늘도 함께 예배드려요.")

                    .font(AppFonts.body)

                    .foregroundStyle(
                        AppColors.textSecondary
                    )

            }

            Spacer()

            ZStack {

                Circle()

                    .fill(
                        AppColors.accent.opacity(0.12)
                    )

                Image(systemName: "person.fill")

                    .font(.system(size: 34))

                    .foregroundStyle(
                        AppColors.accent
                    )

            }

            .frame(
                width: 76,
                height: 76
            )

        }

        .padding(24)

        .liquidGlass(
            .card,
            cornerRadius: AppRadius.large
        )

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        HomeHeader()

            .padding()

    }

}