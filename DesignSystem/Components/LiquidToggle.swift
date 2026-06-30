import SwiftUI

struct LiquidToggle: ToggleStyle {

    func makeBody(configuration: Configuration) -> some View {

        HStack {

            configuration.label

            Spacer()

            RoundedRectangle(

                cornerRadius: 18

            )

            .fill(

                configuration.isOn

                ? AppColors.tint

                : .gray.opacity(0.25)

            )

            .frame(

                width: 54,

                height: 32

            )

            .overlay(alignment: configuration.isOn ? .trailing : .leading) {

                Circle()

                    .fill(.white)

                    .padding(3)

            }

            .onTapGesture {

                withAnimation(.snappy) {

                    configuration.isOn.toggle()

                }

            }

        }

    }

}