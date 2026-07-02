import SwiftUI

struct AccountCard: View {

    var body: some View {

        LiquidCard {

            row("프로필 수정")

            Divider()

            row("비밀번호 변경")

            Divider()

            row("알림 설정")

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

                .foregroundStyle(AppColors.textSecondary)

        }

        .padding(.vertical, 6)

    }

}
