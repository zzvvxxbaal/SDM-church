import SwiftUI

struct ProfileStatSection: View {

    var body: some View {

        LiquidGrid {

            LiquidStatCard(

                title: "출석",

                value: "26",

                icon: "checkmark.circle.fill"

            )

            LiquidStatCard(

                title: "기도",

                value: "12",

                icon: "hands.sparkles.fill"

            )

            LiquidStatCard(

                title: "소그룹",

                value: "8",

                icon: "person.3.fill"

            )

            LiquidStatCard(

                title: "봉사",

                value: "5",

                icon: "heart.fill"

            )

        }

    }

}