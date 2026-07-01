import SwiftUI

struct LiquidBadge: View {

    let title: String

    var body: some View {

        Text(title)

            .font(.caption.weight(.semibold))

            .padding(.horizontal,12)

            .padding(.vertical,7)

            .liquidGlass(.capsule, cornerRadius: 10)

    }

}