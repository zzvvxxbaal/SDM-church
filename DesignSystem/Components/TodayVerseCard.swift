import SwiftUI

struct TodayVerseCard: View {

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 18
        ) {

            Label {

                Text("오늘의 말씀")

                    .font(AppFonts.headline)

            } icon: {

                Image(systemName: "book.closed.fill")

                    .foregroundStyle(
                        AppColors.accent
                    )

            }

            Text("내가 너희에게 평안을 남기노니 곧 나의 평안을 너희에게 주노라.")

                .font(AppFonts.title3)

                .fontWeight(.semibold)

                .fixedSize(horizontal: false, vertical: true)

            Text("요한복음 14:27")

                .font(AppFonts.subheadline)

                .foregroundStyle(
                    AppColors.textSecondary
                )

            Divider()

            HStack {

                Spacer()

                Button {

                } label: {

                    Label(
                        "묵상하기",
                        systemImage: "arrow.right.circle.fill"
                    )

                    .font(AppFonts.subheadline.weight(.semibold))

                }

                .buttonStyle(.plain)

            }

        }

        .padding(24)

        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )

        .liquidGlass(
            .card,
            cornerRadius: AppRadius.large
        )

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        TodayVerseCard()

            .padding()

    }

}
