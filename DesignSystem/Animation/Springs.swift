import SwiftUI

enum Springs {

    static let button = Animation.spring(
        duration: 0.45,
        bounce: 0.25
    )

    static let card = Animation.spring(
        duration: 0.55,
        bounce: 0.18
    )

    static let sheet = Animation.spring(
        duration: 0.60,
        bounce: 0.22
    )

}