import Foundation

struct BibleVerse: Identifiable, Hashable {

    let id = UUID()

    let book: String

    let chapter: Int

    let verse: String

    let content: String

}