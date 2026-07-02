import SwiftUI

struct NoticeCard: View {

    let notice: Notice

    var body: some View {

        Button {

        } label: {

            VStack(
                alignment: .leading,
                spacing: 18
            ) {

                HStack {

                    Text(notice.category)

                        .font(AppFonts.caption)

                        .fontWeight(.semibold)

                        .padding(.horizontal, 10)

                        .padding(.vertical, 5)

                        .background(

                            Capsule()

                                .fill(
                                    AppColors.accent.opacity(0.15)
                                )

                        )

                    Spacer()

                    Text(notice.date)

                        .font(AppFonts.caption)

                        .foregroundStyle(
                            AppColors.textSecondary
                        )

                }

                Text(notice.title)

                    .font(AppFonts.title3)

                    .fontWeight(.bold)

                    .multilineTextAlignment(.leading)

                Text(notice.summary)

                    .font(AppFonts.body)

                    .foregroundStyle(
                        AppColors.textSecondary
                    )

                    .lineLimit(2)

                HStack {

                    Spacer()

                    Image(systemName: "arrow.right.circle.fill")

                        .font(.title3)

                        .foregroundStyle(
                            AppColors.accent
                        )

                }

            }

            .padding(24)

            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )

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

        NoticeCard(

            notice: .init(

                category: "공지",

                title: "여름 수련회 신청",

                summary: "2026년 청년부 여름 수련회 신청이 시작되었습니다.",

                date: "6월 30일"

            )

        )

        .padding()

    }

}