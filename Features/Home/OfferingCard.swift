import SwiftUI

struct OfferingCard: View {

    var body: some View {

        LiquidCard {

            HStack {

                VStack(alignment: .leading, spacing: 10) {

                    Text("온라인 헌금")

                        .font(.headline)

                    Text("헌금 안내")

                        .font(.title3.bold())

                    Text("계좌번호 및 헌금 정보를 확인하세요.")

                        .foregroundStyle(.secondary)

                }

                Spacer()

                Image(systemName: "creditcard.fill")

                    .font(.system(size: 38))

                    .foregroundStyle(.green)

            }

        }

    }

}