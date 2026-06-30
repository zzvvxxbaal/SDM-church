import SwiftUI

struct EmptyStateView: View {

    let image: String

    let title: String

    let subtitle: String

    var body: some View {

        VStack(spacing: 20) {

            Image(systemName: image)

                .font(.system(size: 60))

            Text(title)

                .font(.title2.bold())

            Text(subtitle)

                .foregroundStyle(.secondary)

                .multilineTextAlignment(.center)

        }

        .padding(40)

    }

}