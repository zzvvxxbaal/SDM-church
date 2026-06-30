import SwiftUI

struct WelcomeCard: View {

    var body: some View {

        LiquidCard {

            HStack {

                VStack(alignment: .leading, spacing: 10) {

                    Text("오늘도 평안하세요")

                        .font(.headline)

                        .foregroundStyle(.secondary)

                    Text("하나님께서 함께하십니다.")

                        .font(.title2.bold())

                }

                Spacer()

                Image(systemName: "sun.max.fill")

                    .font(.system(size: 42))

                    .foregroundStyle(.yellow)

            }

        }

    }

}