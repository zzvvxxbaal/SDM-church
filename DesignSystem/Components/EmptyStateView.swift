import SwiftUI

struct EmptyStateView: View {

    let image: String

    let title: String

    let subtitle: String

    var body: some View {

        VStack(spacing: AppSpacing.inset) {

            Image(systemName: image)

                .font(AppFonts.hero)

            Text(title)

                .font(.title2.bold())

            Text(subtitle)

                .foregroundStyle(.secondary)

                .multilineTextAlignment(.center)

        }

        .padding(AppSpacing.jumbo)

    }

}