import Foundation

struct Ministry: Identifiable, Hashable {

    let id = UUID()

    let title: String

    let leader: String

    let meeting: String

    let description: String

}