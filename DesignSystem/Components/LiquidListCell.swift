import SwiftUI

struct LiquidListCell: View {

    let icon: String

    let title: String

    let subtitle: String?

    var action: (() -> Void)?

    var body: some View {

        Button {

            action?()

        } label: {

            HStack(spacing: 18) {

                Image(systemName: icon)

                    .font(.title3)

                    .frame(width: 26)

                    .foregroundStyle(AppColors.accent)

                VStack(
                    alignment: .leading,
                    spacing: 4
                ) {

                    Text(title)

                        .font(AppFonts.body)

                    if let subtitle {

                        Text(subtitle)

                            .font(AppFonts.caption)

                            .foregroundStyle(AppColors.textSecondary)

                    }

                }

                Spacer()

                Image(systemName: "chevron.right")

                    .foregroundStyle(AppColors.textSecondary)

            }

            .padding(20)

        }

        .buttonStyle(.plain)

        .liquidGlass(

            .card,

            cornerRadius: AppRadius.large

        )

    }

}
