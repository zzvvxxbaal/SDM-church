import SwiftUI

struct SettingsAboutCard: View {

    var body: some View {

        LiquidCard {

            Label(
                "앱 정보",
                systemImage: "info.circle.fill"
            )

            Divider()

            info("버전", "1.0.0")

            Divider()

            info("디자인", "Apple iOS 26")

            Divider()

            info("개발", "SDM Church")

        }

    }

    @ViewBuilder

    private func info(
        _ title: String,
        _ value: String
    ) -> some View {

        HStack {

            Text(title)

            Spacer()

            Text(value)

                .foregroundStyle(
                    AppColors.textSecondary
                )

        }

        .padding(.vertical, 6)

    }

}
