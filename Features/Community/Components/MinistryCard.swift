import SwiftUI

struct MinistryCard: View {

    var body: some View {

        LiquidCard {

            Label(
                "사역팀",
                systemImage: "music.mic"
            )

            Divider()

            team("찬양팀")

            Divider()

            team("미디어팀")

            Divider()

            team("새가족팀")

            Divider()

            team("중보기도팀")

        }

    }

    @ViewBuilder

    private func team(
        _ title: String
    ) -> some View {

        HStack {

            Text(title)

                .font(AppFonts.body)

            Spacer()

            Image(systemName: "chevron.right")

                .foregroundStyle(
                    AppColors.textSecondary
                )

        }

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        MinistryCard()

            .padding()

    }

}
