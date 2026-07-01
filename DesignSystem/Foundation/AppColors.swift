import SwiftUI

enum AppColors {
    private static func dynamic(
        light: UIColor,
        dark: UIColor
    ) -> Color {
        Color(UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? dark : light
        })
    }

    static let tint = dynamic(
        light: UIColor(red: 0.20, green: 0.40, blue: 0.80, alpha: 1.0),
        dark: UIColor(red: 0.40, green: 0.60, blue: 1.00, alpha: 1.0)
    )
    static let accent = tint

    static let background = Color(UIColor.systemBackground)
    static let backgroundElevated = dynamic(
        light: UIColor(red: 0.97, green: 0.97, blue: 0.98, alpha: 1.0),
        dark: UIColor(red: 0.08, green: 0.08, blue: 0.10, alpha: 1.0)
    )
    static let surface = dynamic(
        light: .white,
        dark: UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.0)
    )
    static let surfaceSecondary = dynamic(
        light: UIColor(red: 0.97, green: 0.97, blue: 0.98, alpha: 1.0),
        dark: UIColor(red: 0.17, green: 0.17, blue: 0.18, alpha: 1.0)
    )
    static let surfaceTertiary = dynamic(
        light: UIColor(red: 0.93, green: 0.94, blue: 0.96, alpha: 1.0),
        dark: UIColor(red: 0.21, green: 0.21, blue: 0.24, alpha: 1.0)
    )

    static let text = Color(UIColor.label)
    static let textSecondary = Color(UIColor.secondaryLabel)
    static let textTertiary = Color(UIColor.tertiaryLabel)
    static let textOnTint = Color.white

    static let separator = Color(UIColor.separator)
    static let glass = dynamic(
        light: UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.18),
        dark: UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.08)
    )
    static let glassHighlight = dynamic(
        light: UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.32),
        dark: UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.14)
    )
    static let glassShadow = dynamic(
        light: UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.10),
        dark: UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.28)
    )

    static let success = dynamic(
        light: UIColor(red: 0.20, green: 0.62, blue: 0.30, alpha: 1.0),
        dark: UIColor(red: 0.42, green: 0.86, blue: 0.48, alpha: 1.0)
    )
    static let successSoft = dynamic(
        light: UIColor(red: 0.20, green: 0.62, blue: 0.30, alpha: 0.12),
        dark: UIColor(red: 0.42, green: 0.86, blue: 0.48, alpha: 0.18)
    )
    static let warning = dynamic(
        light: UIColor(red: 0.95, green: 0.60, blue: 0.05, alpha: 1.0),
        dark: UIColor(red: 1.00, green: 0.80, blue: 0.24, alpha: 1.0)
    )
    static let warningSoft = dynamic(
        light: UIColor(red: 0.95, green: 0.60, blue: 0.05, alpha: 0.12),
        dark: UIColor(red: 1.00, green: 0.80, blue: 0.24, alpha: 0.18)
    )
    static let error = dynamic(
        light: UIColor(red: 0.82, green: 0.20, blue: 0.18, alpha: 1.0),
        dark: UIColor(red: 1.00, green: 0.40, blue: 0.36, alpha: 1.0)
    )
    static let errorSoft = dynamic(
        light: UIColor(red: 0.82, green: 0.20, blue: 0.18, alpha: 0.12),
        dark: UIColor(red: 1.00, green: 0.40, blue: 0.36, alpha: 0.18)
    )
    static let info = dynamic(
        light: UIColor(red: 0.20, green: 0.52, blue: 0.95, alpha: 1.0),
        dark: UIColor(red: 0.42, green: 0.72, blue: 1.00, alpha: 1.0)
    )
    static let infoSoft = dynamic(
        light: UIColor(red: 0.20, green: 0.52, blue: 0.95, alpha: 0.12),
        dark: UIColor(red: 0.42, green: 0.72, blue: 1.00, alpha: 0.18)
    )
}
