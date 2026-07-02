import SwiftUI

struct LiquidDivider: View {

    var body: some View {

        Rectangle()

            .fill(

                LinearGradient(

                    colors: [

                        .clear,

                        Color.white.opacity(0.20),

                        .clear

                    ],

                    startPoint: .leading,

                    endPoint: .trailing

                )

            )

            .frame(height: 1)

    }

}
