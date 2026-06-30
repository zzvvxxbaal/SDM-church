import SwiftUI

struct HomeHeader: View {

    var body: some View {

        LiquidCard {

            HStack {

                VStack(alignment: .leading, spacing: 8) {

                    Text("좋은 오후입니다")

                        .font(.headline)

                        .foregroundStyle(.secondary)

                    Text("정현석님")

                        .font(.system(size: 36, weight: .bold))

                }

                Spacer()

                LiquidAvatar(

                    initials: "정",

                    size: 72

                )

            }

        }

    }

}
