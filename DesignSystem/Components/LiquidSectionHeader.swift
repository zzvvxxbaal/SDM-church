import SwiftUI

struct LiquidSectionHeader: View {

    let title: String

    let subtitle: String

    var body: some View {

        VStack(alignment: .leading, spacing: 6) {

            Text(title)

                .font(.title2.bold())

            Text(subtitle)

                .foregroundStyle(.secondary)

        }

        .frame(maxWidth: .infinity, alignment: .leading)

    }

}