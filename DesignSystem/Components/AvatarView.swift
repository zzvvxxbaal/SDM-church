import SwiftUI

struct AvatarView: View {

    let image: Image?

    let name: String

    var size: CGFloat = 60

    var body: some View {

        ZStack {

            Circle()

                .fill(.clear)

                .glassBackgroundEffect()

            if let image {

                image

                    .resizable()

                    .scaledToFill()

            } else {

                Text(initials)

                    .font(.system(size: size * 0.34, weight: .bold))

                    .foregroundStyle(.primary)

            }

        }

        .frame(width: size, height: size)

        .clipShape(Circle())

        .overlay {

            Circle()

                .strokeBorder(

                    Color.white.opacity(0.25),

                    lineWidth: 1

                )

        }

    }

    private var initials: String {

        let parts = name.split(separator: " ")

        if parts.count >= 2 {

            return "\(parts[0].prefix(1))\(parts[1].prefix(1))"

        }

        return String(name.prefix(2))

    }

}
