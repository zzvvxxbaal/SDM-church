import Foundation

struct SmallGroup: Identifiable {

    let id = UUID()

    let leader: String

    let groupName: String

    let location: String

    let memberCount: Int

}