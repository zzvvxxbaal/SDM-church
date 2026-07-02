import SwiftUI

struct GlassModifier: ViewModifier {

    var material: GlassProvider.Material = .regular

    func body(content: Content) -> some View {

        GlassSurface(
            material: material
        ) {

            content

        }

    }

}

extension View {

    func glass(
        _ material: GlassProvider.Material = .regular
    ) -> some View {

        modifier(

            GlassModifier(
                material: material
            )

        )

    }

}