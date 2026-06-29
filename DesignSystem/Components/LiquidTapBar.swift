import SwiftUI

struct LiquidTabBar: View {

    @Binding
    var selection: Int

    var body: some View {

        HStack {

            tab(
                image: "house.fill",
                index: 0
            )

            Spacer()

            tab(
                image: "calendar",
                index: 1
            )

            Spacer()

            tab(
                image: "hands.sparkles.fill",
                index: 2
            )

            Spacer()

            tab(
                image: "person.3.fill",
                index: 3
            )

            Spacer()

            tab(
                image: "gearshape.fill",
                index: 4
            )

        }

        .padding(.horizontal,28)

        .frame(height:70)

        .glass()

    }

    @ViewBuilder

    private func tab(

        image: String,

        index: Int

    ) -> some View {

        Button {

            selection = index

        } label: {

            Image(systemName: image)

                .font(.title3)

                .foregroundStyle(

                    selection == index

                    ? AppColors.tint

                    : .secondary

                )

        }

    }

}

#Preview {

    @Previewable @State var tab = 0

    LiquidTabBar(selection: $tab)

}