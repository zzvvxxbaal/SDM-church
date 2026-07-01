import SwiftUI

struct LiquidIconButton: View {

    let systemImage: String

    let action: () -> Void

    var body: some View {

        Button(action: action) {

            Image(systemName: systemImage)

                .font(.title3)

                .frame(width: 52, height: 52)

        }

        .buttonStyle(.plain)

        .liquidGlass(.button, cornerRadius: 26)

    }

}