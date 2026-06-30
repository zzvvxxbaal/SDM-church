import SwiftUI

struct PrayerInputCard: View {

    @State

    private var prayer = ""

    var body: some View {

        LiquidCard {

            Text("기도제목 작성")

                .font(.headline)

            TextEditor(

                text: $prayer

            )

            .frame(height: 130)

            .scrollContentBackground(.hidden)

            .background(Color.clear)

            Button {

            } label: {

                Text("등록")

            }

            .buttonStyle(LiquidButton())

        }

    }

}