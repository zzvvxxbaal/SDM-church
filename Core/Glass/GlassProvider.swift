import SwiftUI

enum GlassProvider {

    enum Material {

        case ultraThin
        case thin
        case regular
        case thick
        case navigation
        case toolbar
        case floating
        case card
        case button

    }

    static func configuration(
        for material: Material
    ) -> GlassConfiguration {

        switch material {

        case .ultraThin:

            return .init(
                opacity: 0.05,
                blur: 24,
                cornerRadius: 30,
                shadow: 18,
                border: 1,
                highlight: 0.22,
                reflection: 0.08
            )

        case .thin:

            return .init(
                opacity: 0.08,
                blur: 28,
                cornerRadius: 32,
                shadow: 22,
                border: 1.2,
                highlight: 0.26,
                reflection: 0.10
            )

        case .regular:

            return .init(
                opacity: 0.10,
                blur: 30,
                cornerRadius: 34,
                shadow: 24,
                border: 1.3,
                highlight: 0.30,
                reflection: 0.12
            )

        case .thick:

            return .init(
                opacity: 0.14,
                blur: 36,
                cornerRadius: 36,
                shadow: 30,
                border: 1.5,
                highlight: 0.34,
                reflection: 0.15
            )

        case .navigation:

            return .init(
                opacity: 0.10,
                blur: 34,
                cornerRadius: 26,
                shadow: 18,
                border: 1,
                highlight: 0.28,
                reflection: 0.12
            )

        case .toolbar:

            return .init(
                opacity: 0.08,
                blur: 30,
                cornerRadius: 22,
                shadow: 18,
                border: 1,
                highlight: 0.26,
                reflection: 0.10
            )

        case .floating:

            return .init(
                opacity: 0.11,
                blur: 34,
                cornerRadius: 34,
                shadow: 30,
                border: 1.5,
                highlight: 0.34,
                reflection: 0.15
            )

        case .card:

            return .init(
                opacity: 0.09,
                blur: 30,
                cornerRadius: 30,
                shadow: 24,
                border: 1.2,
                highlight: 0.28,
                reflection: 0.10
            )

        case .button:

            return .init(
                opacity: 0.08,
                blur: 26,
                cornerRadius: 18,
                shadow: 14,
                border: 1,
                highlight: 0.25,
                reflection: 0.08
            )

        }

    }

}