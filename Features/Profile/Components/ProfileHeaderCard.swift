import SwiftUI

struct ProfileHeaderCard: View {

    var body: some View {

        LiquidCard {

            HStack(spacing: 20) {

                Circle()

                    .fill(AppColors.accent.opacity(0.15))

                    .frame(width: 82, height: 82)

                    .overlay {

                        Image(systemName: "person.fill")

                            .font(.system(size: 34))

                            .foregroundStyle(AppColors.accent)

                    }

                VStack(
                    alignment: .leading,
                    spacing: 6
                ) {

                    Text("정현석")

                        .font(AppFonts.title2)

                        .fontWeight(.bold)

                    Text("청년부")

                        .foregroundStyle(AppColors.textSecondary)

                    Text("SDM Church")

                        .foregroundStyle(AppColors.textSecondary)

                }

                Spacer()

            }

        }

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        ProfileHeaderCard()

            .padding()

    }

}
