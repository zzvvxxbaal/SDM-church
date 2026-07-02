import SwiftUI

struct ErrorStateView: View {

    let title: String

    let message: String

    let retry: () -> Void

    var body: some View {

        VStack(spacing: 20) {

            Image(systemName: "exclamationmark.triangle.fill")

                .font(.system(size: 48))

                .foregroundStyle(.orange)

            Text(title)

                .font(AppFonts.title2)

                .fontWeight(.bold)

                .multilineTextAlignment(.center)

            Text(message)

                .font(AppFonts.body)

                .foregroundStyle(AppColors.textSecondary)

                .multilineTextAlignment(.center)

            Button("다시 시도") {

                retry()

            }

            .buttonStyle(.plain)

            .liquidGlass(
                .button,
                cornerRadius: AppRadius.full
            )

        }

        .padding(32)

        .frame(maxWidth: .infinity)

        .liquidGlass(
            .card,
            cornerRadius: AppRadius.extraLarge
        )

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        ErrorStateView(

            title: "네트워크 오류",

            message: "인터넷 연결을 확인한 후 다시 시도하세요."

        ) {

        }

        .padding()

    }

}
