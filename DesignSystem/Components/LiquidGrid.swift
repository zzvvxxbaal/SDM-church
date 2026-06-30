import SwiftUI

struct LiquidGrid<Content: View>: View {

    @ViewBuilder

    let content: Content

    private let columns = [

        GridItem(.flexible()),

        GridItem(.flexible())

    ]

    var body: some View {

        LazyVGrid(

            columns: columns,

            spacing: 18

        ) {

            content

        }

    }

}