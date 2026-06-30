import SwiftUI

struct AboutCard: View {

    var body: some View {

        LiquidCard {

            VStack(alignment: .leading, spacing: 12) {

                Text("서대문교회 청년부")

                    .font(.headline)

                Text("Version 1.0")

                    .foregroundStyle(.secondary)

                Text("© 2026 Seodaemun Church")

                    .font(.caption)

                    .foregroundStyle(.tertiary)

            }

        }

    }

}