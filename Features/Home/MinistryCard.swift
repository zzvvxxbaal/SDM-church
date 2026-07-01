import SwiftUI

struct MinistryCard: View {

    var body: some View {

        LiquidCard {

            VStack(alignment: .leading, spacing: AppSpacing.compact) {

                Text("사역팀 모집")

                    .font(.headline)

                Text("예배팀 · 미디어팀 · 새가족팀")

                    .font(.title3.bold())

                Text("함께 사역할 청년을 기다립니다.")

                    .foregroundStyle(.secondary)

            }

        }

    }

}