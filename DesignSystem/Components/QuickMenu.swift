import SwiftUI

struct QuickMenu: View {

    private let items: [QuickMenuItem] = [

        .init(
            title: "예배",
            icon: "church"
        ),

        .init(
            title: "공지",
            icon: "megaphone.fill"
        ),

        .init(
            title: "기도",
            icon: "hands.sparkles.fill"
        ),

        .init(
            title: "소그룹",
            icon: "person.3.fill"
        )

    ]

    private let columns = Array(
        repeating: GridItem(.flexible(), spacing: 16),
        count: 4
    )

    var body: some View {

        LazyVGrid(
            columns: columns,
            spacing: 16
        ) {

            ForEach(items) { item in

                Button {

                } label: {

                    VStack(spacing: 12) {

                        ZStack {

                            Circle()

                                .fill(
                                    AppColors.accent.opacity(0.12)
                                )

                                .frame(
                                    width: 58,
                                    height: 58
                                )

                            Image(systemName: item.icon)

                                .font(.title3.weight(.semibold))

                                .foregroundStyle(
                                    AppColors.accent
                                )

                        }

                        Text(item.title)

                            .font(AppFonts.caption)

                            .foregroundStyle(
                                AppColors.textPrimary
                            )

                            .lineLimit(1)

                    }

                    .frame(
                        maxWidth: .infinity
                    )

                    .padding(.vertical, 8)

                }

                .buttonStyle(.plain)

            }

        }

        .padding(24)

        .liquidGlass(
            .card,
            cornerRadius: AppRadius.large
        )

    }

}

private struct QuickMenuItem: Identifiable {

    let id = UUID()

    let title: String

    let icon: String

}

#Preview {

    ZStack {

        MeshGradientBackground()

        QuickMenu()

            .padding()

    }

}