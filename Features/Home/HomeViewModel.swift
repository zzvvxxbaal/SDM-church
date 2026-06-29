import Foundation
import Observation

@Observable
final class HomeViewModel {

    let sections: [HomeSection] = [

        HomeSection(
            title: "오늘의 말씀",
            subtitle: "말씀을 묵상하며 하루를 시작하세요.",
            icon: "book.closed.fill"
        ),

        HomeSection(
            title: "이번 주 예배",
            subtitle: "주일 오후 2:00 · 청년부 예배",
            icon: "church"
        ),

        HomeSection(
            title: "공지사항",
            subtitle: "새로운 공지를 확인하세요.",
            icon: "megaphone.fill"
        ),

        HomeSection(
            title: "기도제목",
            subtitle: "함께 기도해주세요.",
            icon: "hands.sparkles.fill"
        ),

        HomeSection(
            title: "소그룹",
            subtitle: "이번 주 소그룹 모임",
            icon: "person.3.fill"
        )

    ]

}