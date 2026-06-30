import Foundation
import Observation

@Observable
final class NoticeViewModel {

    let notices: [Notice] = [

        .init(
            title: "여름 수련회 신청",
            summary: "이번 주까지 신청을 완료해주세요.",
            date: "6월 30일",
            isPinned: true
        ),

        .init(
            title: "금요기도회",
            summary: "금요일 오후 8시 본당",
            date: "6월 28일",
            isPinned: false
        ),

        .init(
            title: "새가족 환영",
            summary: "새가족 식사가 있습니다.",
            date: "6월 25일",
            isPinned: false
        )

    ]

}