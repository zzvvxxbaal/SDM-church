import SwiftUI

struct CommunityMemberCard: View {

    var body: some View {

        LiquidCard {

            Label(
                "새가족",
                systemImage: "person.crop.circle.badge.plus"
            )

            Divider()

            Text("새로운 청년들을 환영합니다.")

                .font(AppFonts.body)

                .foregroundStyle(
                    AppColors.textSecondary
                )

            Button {

            } label: {

                Text("환영하기")

                    .frame(maxWidth: .infinity)

            }

            .buttonStyle(.borderedProminent)

        }

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        CommunityMemberCard()

            .padding()

    }

}
