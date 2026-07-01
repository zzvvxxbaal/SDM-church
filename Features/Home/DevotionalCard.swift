import SwiftUI

struct DevotionalCard: View {

    var body: some View {

        LiquidCard {

            VStack(alignment: .leading, spacing: AppSpacing.compact) {

                Text("QT")

                    .font(.headline)

                Text("오늘의 묵상")

                    .font(.title3.bold())

                Text("말씀을 묵상하며 하루를 시작해보세요.")

                    .foregroundStyle(.secondary)

            }

        }

    }

}