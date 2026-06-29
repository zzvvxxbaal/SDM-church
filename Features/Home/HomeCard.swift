import SwiftUI

struct HomeCard: View {

    let section: HomeSection

    var body: some View {

        LiquidCard {

            HStack(alignment: .top, spacing: 18) {

                Image(systemName: section.icon)

                    .font(.system(size: 28))

                    .foregroundStyle(AppColors.tint)

                    .frame(width: 42)

                VStack(alignment: .leading, spacing: 8) {

                    Text(section.title)

                        .font(AppFonts.headline)

                    Text(section.subtitle)

                        .font(AppFonts.body)

                        .foregroundStyle(.secondary)

                }

                Spacer()

                Image(systemName: "chevron.right")

                    .foregroundStyle(.tertiary)

            }

        }

    }

}

#Preview {

    HomeCard(

        section: HomeSection(

            title: "오늘의 말씀",

            subtitle: "말씀을 묵상하세요.",

            icon: "book.closed.fill"

        )

    )

}