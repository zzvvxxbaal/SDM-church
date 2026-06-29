import SwiftUI

struct FloatingGlassTabBar<Content: View>: View {

    @ViewBuilder

    let content: Content

    var body: some View {

        HStack {

            content

        }

        .padding(.horizontal,24)

        .padding(.vertical,14)

        .glass()

        .shadow(

            color: .black.opacity(0.12),

            radius: 35,

            y: 18

        )

    }

}