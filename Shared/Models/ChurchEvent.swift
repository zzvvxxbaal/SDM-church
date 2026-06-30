import Foundation

struct ChurchEvent: Identifiable, Hashable {

    let id = UUID()

    let title: String

    let startDate: Date

    let endDate: Date

    let location: String

    let description: String

    let imageName: String

}