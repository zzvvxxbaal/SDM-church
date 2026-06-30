import Foundation

extension Date {

    var koreanDate: String {

        let formatter = DateFormatter()

        formatter.locale = Locale(identifier: "ko_KR")

        formatter.dateStyle = .long

        return formatter.string(from: self)

    }

}