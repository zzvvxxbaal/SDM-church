import SwiftUI

struct LiquidLargeTitle: View {

    let title: String

    let subtitle: String

    var body: some View {

        VStack(alignment: .leading, spacing: 6) {

            Text(title)

                .font(.system(size: 42, weight: .bold))

            Text(subtitle)

                .font(.headline)

                .foregroundStyle(.secondary)

        }

        .frame(maxWidth: .infinity, alignment: .leading)

    }

}