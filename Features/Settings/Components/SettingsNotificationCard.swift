import SwiftUI

struct SettingsNotificationCard: View {

    var body: some View {

        LiquidCard {

            Label(
                "알림",
                systemImage: "bell.badge.fill"
            )

            Divider()

            Toggle("예배 알림", isOn: .constant(true))

            Divider()

            Toggle("공지사항", isOn: .constant(true))

            Divider()

            Toggle("기도제목", isOn: .constant(false))

        }

    }

}
