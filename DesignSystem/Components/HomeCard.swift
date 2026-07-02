import SwiftUI

struct HomeCard: View {

    let section: HomeSection

    var body: some View {

        Button {

        } label: {

            HStack(spacing: AppSpacing.large) {

                ZStack {

                    Circle()

                        .fill(
                            AppColors.accent.opacity(0.12)
                        )

                        .frame(
                            width: 56,
                            height: 56
                        )

                    Image(
                        systemName: section.icon
                    )

                    .font(
                        .title3.weight(.semibold)
                    )

                    .foregroundStyle(
                        AppColors.accent
                    )

                }

                VStack(
                    alignment: .leading,
                    spacing: 6
                ) {

                    Text(section.title)

                        .font(AppFonts.headline)

                        .foregroundStyle(
                            AppColors.textPrimary
                        )

                    Text(section.subtitle)

                        .font(AppFonts.subheadline)

                        .foregroundStyle(
                            AppColors.textSecondary
                        )

                        .lineLimit(2)

                }

                Spacer()

                Image(systemName: "chevron.right")

                    .font(.headline)

                    .foregroundStyle(
                        AppColors.textSecondary
                    )

            }

            .padding(24)

            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )

        }

        .buttonStyle(.plain)

        .liquidGlass(
            .card,
            cornerRadius: AppRadius.large
        )

        .contentShape(
            RoundedRectangle(
                cornerRadius: AppRadius.large,
                style: .continuous
            )
        )

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        HomeCard(

            section: .init(

                title: "이번 주 예배",

                subtitle: "주일 오후 2:00",

                icon: "church"

            )

        )

        .padding()

    }

}