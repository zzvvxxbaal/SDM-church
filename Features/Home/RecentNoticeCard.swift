import SwiftUI

struct RecentNoticeCard: View {

    var body: some View {

        LiquidCard {

            VStack(alignment: .leading, spacing: AppSpacing.mdPlus) {

                HStack {

                    Text("최신 공지")

                        .font(.headline)

                    Spacer()

                    LiquidBadge(

                        title: "NEW"

                    )

                }

                Text("여름수련회 신청이 시작되었습니다.")

                    .font(.body)

                    .foregroundStyle(.secondary)

            }

        }

    }

}