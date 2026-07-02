import SwiftUI

struct LiquidLoginButton: View {

    let title: String

    let systemImage: String

    var body: some View {

        Button {

        } label: {

            HStack {

                Image(systemName: systemImage)

                    .font(.title3)

                    .frame(width: 28)

                Text(title)

                    .font(AppFonts.headline)

                Spacer()

            }

            .padding(.horizontal, 22)

            .frame(height: 60)

        }

        .buttonStyle(.plain)

        .liquidGlass(
            .button,
            cornerRadius: AppRadius.full
        )

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        LiquidLoginButton(

            title: "Apple로 계속하기",

            systemImage: "apple.logo"

        )

        .padding()

    }

}
