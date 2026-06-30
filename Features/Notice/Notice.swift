import Foundation

struct Notice: Identifiable, Hashable {

    let id = UUID()

    let title: String

    let summary: String

    let date: String

    let isPinned: Bool

}