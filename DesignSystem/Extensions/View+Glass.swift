import SwiftUI

extension View {

    func glass() -> some View {

        modifier(GlassMaterial())

    }

    func glassSurface() -> some View {

        modifier(GlassSurface())

    }

}