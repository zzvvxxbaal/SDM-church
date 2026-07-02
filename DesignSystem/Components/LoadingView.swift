import SwiftUI

struct LoadingView: View {

    var body: some View {

        VStack(spacing: 20) {

            ProgressView()

                .controlSize(.large)

            Text("불러오는 중...")

                .font(AppFonts.body)

        }

        .padding(32)

        .liquidGlass(
            .floating,
            cornerRadius: AppRadius.extraLarge
        )

    }

}
