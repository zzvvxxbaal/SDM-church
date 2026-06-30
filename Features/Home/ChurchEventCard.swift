import SwiftUI

struct ChurchEventCard: View {

    var body: some View {

        LiquidCard {

            HStack {

                VStack(

                    alignment: .leading,

                    spacing: 12

                ) {

                    Text("다가오는 행사")

                        .font(.headline)

                    Text("2026 여름수련회")

                        .font(.title3.bold())

                    Text("7월 24일 ~ 26일")

                        .foregroundStyle(.secondary)

                }

                Spacer()

                Image(systemName: "tent.fill")

                    .font(.system(size: 42))

                    .foregroundStyle(AppColors.tint)

            }

        }

    }

}