import Foundation

struct Attendance: Identifiable {

    let id = UUID()

    let date: Date

    let worship: String

    let attended: Bool

}