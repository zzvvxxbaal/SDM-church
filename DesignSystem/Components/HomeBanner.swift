import SwiftUI

struct HomeBanner: View {

    var body: some View {

        ZStack(alignment: .bottomLeading) {

            LinearGradient(

                colors: [

                    AppColors.accent.opacity(0.35),

                    AppColors.accent.opacity(0.15),

                    .clear

                ],

                startPoint: .topLeading,

                endPoint: .bottomTrailing

            )

            VStack(
                alignment: .leading,
                spacing: 12
            ) {

                Text("이번 주 예배")

                    .font(AppFonts.caption)

                    .fontWeight(.semibold)

                    .foregroundStyle(
                        AppColors.textSecondary
                    )

                    .textCase(.uppercase)

                Text("하나님과\n더 가까워지는 시간")

                    .font(AppFonts.largeTitle)

                    .fontWeight(.bold)

                    .multilineTextAlignment(.leading)

                Text("주일 오후 2:00")

                    .font(AppFonts.body)

                    .foregroundStyle(
                        AppColors.textSecondary
                    )

                Spacer()

                Button {

                } label: {

                    Label(
                        "자세히 보기",
                        systemImage: "arrow.right"
                    )

                    .font(
                        AppFonts.subheadline.weight(.semibold)
                    )

                }

                .buttonStyle(.plain)

            }

            .padding(28)

        }

        .frame(height: 220)

        .frame(maxWidth: .infinity)

        .liquidGlass(
            .floating,
            cornerRadius: AppRadius.extraLarge
        )

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        HomeBanner()

            .padding()

    }

}
