import SwiftUI

struct FloatingActionButton: View {

    let systemImage: String

    let action: () -> Void

    var body: some View {

        Button(

            action: action

        ) {

            Image(

                systemName: systemImage

            )

            .font(.title2)

            .frame(

                width: 64,

                height: 64

            )

        }

        .buttonStyle(.plain)

        .glass()

    }

}