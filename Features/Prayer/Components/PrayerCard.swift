import SwiftUI

struct PrayerCard: View {

    let title: String

    let content: String

    let author: String

    let date: String

    var body: some View {

        Button {

        } label: {

            VStack(
                alignment: .leading,
                spacing: 18
            ) {

                HStack {

                    Image(systemName: "hands.sparkles.fill")

                        .font(.title3)

                        .foregroundStyle(AppColors.accent)

                    Text(title)

                        .font(AppFonts.headline)

                        .fontWeight(.semibold)

                }

                Text(content)

                    .font(AppFonts.body)

                    .foregroundStyle(AppColors.textSecondary)

                    .multilineTextAlignment(.leading)

                    .fixedSize(
                        horizontal: false,
                        vertical: true
                    )

                Divider()

                HStack {

                    Label(
                        author,
                        systemImage: "person.fill"
                    )

                    Spacer()

                    Label(
                        date,
                        systemImage: "calendar"
                    )

                }

                .font(AppFonts.caption)

                .foregroundStyle(AppColors.textSecondary)

            }

            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )

            .padding(24)

        }

        .buttonStyle(.plain)

        .liquidGlass(
            .card,
            cornerRadius: AppRadius.large
        )

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        PrayerCard(

            title: "오늘의 기도",

            content: "하나님, 오늘도 믿음 안에서 살아갈 수 있도록 인도하여 주세요.",

            author: "청년부",

            date: "2026.07.02"

        )

        .padding()

    }

}