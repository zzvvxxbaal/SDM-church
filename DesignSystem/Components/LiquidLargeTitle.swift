import SwiftUI

struct LiquidLargeTitle: View {

    let title: String

    let subtitle: String?

    init(
        title: String,
        subtitle: String? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
    }

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: AppSpacing.small
        ) {

            if let subtitle {

                Text(subtitle.uppercased())

                    .font(AppFonts.caption)

                    .fontWeight(.semibold)

                    .foregroundStyle(AppColors.accent)

                    .tracking(1.4)

                    .textCase(.uppercase)

            }

            Text(title)

                .font(AppFonts.extraLargeTitle)

                .fontWeight(.bold)

                .multilineTextAlignment(.leading)

                .minimumScaleFactor(0.7)

                .lineLimit(2)

                .accessibilityAddTraits(.isHeader)

        }

        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )

        .padding(.horizontal, AppSpacing.small)

        .padding(.top, AppSpacing.small)

        .padding(.bottom, AppSpacing.medium)

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        LiquidLargeTitle(

            title: "서대문교회",

            subtitle: "청년부"

        )

        .padding()

    }

}