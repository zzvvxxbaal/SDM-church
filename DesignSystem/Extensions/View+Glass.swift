import SwiftUI

extension View {

    func glass() -> some View {

        modifier(GlassShader())

    }

    func glassSurface() -> some View {

        modifier(GlassSurface())

    }

}