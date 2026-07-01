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
                    .accessibilityLabel("프로필 이미지")
            } else {
                Text(initials)
                    .font(.title.weight(.bold))
                    .minimumScaleFactor(0.5)
            }
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
        .overlay {
            Circle()
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            AppColors.glassHighlight.opacity(0.75),
                            AppColors.glass.opacity(0.85)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1.5
                )
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("프로필 아바타")
        .accessibilityValue(initials)
    }
}

#Preview {
    LiquidAvatar()
}
