import SwiftUI

struct LiquidCard<Content: View>: View {

    private let material: GlassProvider.Material

    private let content: Content

    init(
        material: GlassProvider.Material = .card,
        @ViewBuilder content: () -> Content
    ) {
        self.material = material
        self.content = content()
    }

    var body: some View {

        GlassSurface(
            material: material
        ) {

            VStack(
                alignment: .leading,
                spacing: 16
            ) {

                content

            }
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .padding(24)

        }

    }

}

#Preview {

    ZStack {

        MeshGradientBackground()

        LiquidCard {

            Text("서대문교회")

                .font(.title.bold())

            Text("청년부")

                .foregroundStyle(.secondary)

        }
        .padding()

    }

}