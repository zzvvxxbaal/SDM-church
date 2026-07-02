import SwiftUI

struct SettingsAccountCard: View {

    var body: some View {

        LiquidCard {

            Label(
                "계정",
                systemImage: "person.crop.circle.fill"
            )

            Divider()

            row("프로필")

            Divider()

            row("비밀번호")

            Divider()

            row("로그아웃")

        }

    }

    @ViewBuilder

    private func row(
        _ title: String
    ) -> some View {

        HStack {

            Text(title)

            Spacer()

            Image(systemName: "chevron.right")

                .foregroundStyle(
                    AppColors.textSecondary
                )

        }

        .padding(.vertical, 6)

    }

}