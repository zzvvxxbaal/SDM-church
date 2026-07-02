import SwiftUI

struct EmptyStateView: View {

    let icon: String

    let title: String

    let subtitle: String

    var body: some View {

        VStack(spacing: 20) {

            Image(systemName: icon)

                .font(.system(size: 48))

                .foregroundStyle(AppColors.accent)

            Text(title)

                .font(AppFonts.title2)

                .fontWeight(.bold)

            Text(subtitle)

                .font(AppFonts.body)

                .foregroundStyle(AppColors.textSecondary)

                .multilineTextAlignment(.center)

        }

        .padding(32)

        .frame(maxWidth: .infinity)

        .liquidGlass(
            .card,
            cornerRadius: AppRadius.extraLarge
        )

    }

}