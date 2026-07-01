import SwiftUI

struct MeshGradientBackground: View {

    @Environment(\.colorScheme) private var colorScheme
    @State private var animate = false

    var body: some View {
        TimelineView(.animation) { _ in

            ZStack {

                AppColors.backgroundElevated

                Circle()

                    .fill(
                        Color.blue.opacity(0.12)
                    )

                    .frame(width: 420)

                    .blur(radius: 80)

                    .offset(
                        x: animate ? -120 : 120,
                        y: animate ? -180 : -80
                    )

                Circle()

                    .fill(
                        (colorScheme == .dark ? AppColors.surfaceSecondary : .white).opacity(colorScheme == .dark ? 0.35 : 0.85)
                    )

                    .frame(width: 500)

                    .blur(radius: 100)

                    .offset(
                        x: animate ? 160 : -100,
                        y: animate ? 220 : 120
                    )

                Circle()

                    .fill(
                        Color.cyan.opacity(0.08)
                    )

                    .frame(width: 380)

                    .blur(radius: 90)

                    .offset(
                        x: animate ? 130 : -140,
                        y: animate ? -40 : 120
                    )

            }

            .ignoresSafeArea()

            .onAppear {
                guard !animate else { return }

                withAnimation(
                    .linear(duration: 18)
                        .repeatForever(autoreverses: true)
                ) {
                    animate = true
                }
            }
            .onDisappear {
                animate = false
            }

        }

    }

}