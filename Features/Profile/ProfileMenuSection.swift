import SwiftUI

struct ProfileMenuSection: View {

    var body: some View {

        VStack(spacing: 14) {

            LiquidListRow {

                Label(

                    "내 정보",

                    systemImage: "person.crop.circle"

                )

            }

            LiquidListRow {

                Label(

                    "기도제목",

                    systemImage: "hands.sparkles"

                )

            }

            LiquidListRow {

                Label(

                    "설정",

                    systemImage: "gearshape"

                )

            }

        }

    }

}