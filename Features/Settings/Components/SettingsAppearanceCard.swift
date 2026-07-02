import SwiftUI

struct SettingsAppearanceCard: View {

    var body: some View {

        LiquidCard {

            Label(
                "화면",
                systemImage: "circle.lefthalf.filled"
            )

            Divider()

            HStack {

                Text("Liquid Glass")

                Spacer()

                Text("iOS 26")

                    .foregroundStyle(
                        AppColors.textSecondary
                    )

            }

            Divider()

            HStack {

                Text("테마")

                Spacer()

                Text("System")

                    .foregroundStyle(
                        AppColors.textSecondary
                    )

            }

        }

    }

}
