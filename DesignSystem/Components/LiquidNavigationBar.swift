import SwiftUI

struct LiquidNavigationBar: View {

    let title: String

    var trailing: AnyView?

    init(
        title: String,
        trailing: AnyView? = nil
    ) {
        self.title = title
        self.trailing = trailing
    }

    var body: some View {

        HStack(spacing: AppSpacing.medium) {

            Text(title)

                .font(AppFonts.largeTitle)

                .fontWeight(.bold)

                .lineLimit(1)

                .minimumScaleFactor(0.75)

                .accessibilityAddTraits(.isHeader)

            Spacer()

            if let trailing {

                trailing

            } else {

                Button {

                } label: {

                    Image(systemName: "bell.badge")

                        .font(.title3.weight(.semibold))

                        .frame(width: 44, height: 44)

                }

                .buttonStyle(.plain)

                .liquidGlass(
                    .button,
                    cornerRadius: AppRadius.full
                )

            }

        }

        .padding(.horizontal, AppSpacing.large)

        .padding(.vertical, AppSpacing.small)

        .liquidGlass(
            .navigation,
            cornerRadius: AppRadius.sheet
        )

        .accessibilityElement(children: .combine)

        .accessibilityLabel(title)

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        LiquidNavigationBar(
            title: "서대문교회"
        )

        .padding()

    }

}