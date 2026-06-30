import Observation

@Observable

final class SettingsViewModel {

    let items = [

        SettingItem(

            title: "알림",

            icon: "bell.badge"

        ),

        SettingItem(

            title: "다크 모드",

            icon: "moon"

        ),

        SettingItem(

            title: "개인정보",

            icon: "lock"

        ),

        SettingItem(

            title: "문의하기",

            icon: "bubble.left"

        ),

        SettingItem(

            title: "앱 정보",

            icon: "info.circle"

        )

    ]

}