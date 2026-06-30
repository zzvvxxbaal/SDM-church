import Foundation

struct User: Identifiable {

    let id = UUID()

    var name: String

    var email: String

    var profileImage: String?

}