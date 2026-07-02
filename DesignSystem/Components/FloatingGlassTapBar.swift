import SwiftUI

struct FloatingGlassTabBar<Content: View>: View {

    @ViewBuilder
    let content: Content

    var body: some View {

        HStack(spacing: AppSpacing.large) {

            content

        }

        .frame(maxWidth: .infinity)

        .frame(height: 68)

        .padding(.horizontal, AppSpacing.large)

        .background {

            RoundedRectangle(

                cornerRadius: AppRadius.full,

                style: .continuous

            )

            .glassBackgroundEffect()

        }

        .overlay {

            RoundedRectangle(

                cornerRadius: AppRadius.full,

                style: .continuous

            )

            .strokeBorder(

                LinearGradient(

                    colors: [

                        Color.white.opacity(0.28),

                        Color.white.opacity(0.05)

                    ],

                    startPoint: .topLeading,

                    endPoint: .bottomTrailing

                ),

                lineWidth: 1

            )

        }

        .shadow(

            color: .black.opacity(0.12),

            radius: 22,

            y: 12

        )

        .padding(.horizontal, AppSpacing.large)

        .padding(.bottom, AppSpacing.medium)

    }

}

#Preview {

    ZStack(alignment: .bottom) {

        MeshGradientBackground()

        FloatingGlassTabBar {

            Spacer()

            Image(systemName: "house.fill")

            Spacer()

            Image(systemName: "calendar")

            Spacer()

            Image(systemName: "hands.sparkles.fill")

            Spacer()

            Image(systemName: "person.3.fill")

            Spacer()

            Image(systemName: "gearshape.fill")

            Spacer()

        }

    }

}