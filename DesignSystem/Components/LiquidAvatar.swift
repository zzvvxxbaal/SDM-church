import SwiftUI

struct LiquidAvatar: View {

    var image: Image?

    var initials: String = "S"

    var size: CGFloat = 72

    var body: some View {

        ZStack {

            Circle()

                .fill(.ultraThinMaterial)

            if let image {

                image

                    .resizable()

                    .scaledToFill()

            } else {

                Text(initials)

                    .font(.system(size: size * 0.36, weight: .bold))

            }

        }

        .frame(width: size, height: size)

        .clipShape(Circle())

        .overlay {

            Circle()

                .stroke(.white.opacity(0.35), lineWidth: 1)

        }

    }

}

#Preview {

    LiquidAvatar()

}