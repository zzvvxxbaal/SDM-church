import SwiftUI

struct LeaderCard: View {

    var body: some View {

        LiquidCard {

            VStack(alignment: .leading, spacing: 12) {

                Text("조장")

                    .font(.headline)

                Text("홍길동")

                    .font(.title3.bold())

                Text("1조")

                    .foregroundStyle(.secondary)

            }

        }

    }

}