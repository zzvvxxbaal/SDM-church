import Foundation
import Observation

@Observable

final class CalendarViewModel {

    let events = [

        CalendarEvent(

            title: "주일예배",

            time: "14:00",

            place: "청년부실"

        ),

        CalendarEvent(

            title: "금요기도회",

            time: "20:00",

            place: "본당"

        ),

        CalendarEvent(

            title: "소그룹",

            time: "19:00",

            place: "각 조 모임"

        )

    ]

}