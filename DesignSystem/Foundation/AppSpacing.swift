import CoreGraphics

enum AppSpacing {
    static let none: CGFloat = 0
    static let hairline: CGFloat = 1
    static let micro: CGFloat = 3
    static let xxs: CGFloat = 2
    static let xs: CGFloat = 4
    static let xsWide: CGFloat = 6
    static let smWide: CGFloat = 7
    static let sm: CGFloat = 8
    static let smPlus: CGFloat = 10
    static let md: CGFloat = 12
    static let mdPlus: CGFloat = 14
    static let lg: CGFloat = 16
    static let content: CGFloat = 18
    static let xl: CGFloat = 20
    static let control: CGFloat = 22
    static let xxl: CGFloat = 24
    static let floating: CGFloat = 28
    static let xxxl: CGFloat = 32
    static let jumbo: CGFloat = 40
    static let section: CGFloat = 48
    static let screen: CGFloat = 60

    static let xSmall = xs
    static let small = sm
    static let compact = md
    static let medium = lg
    static let inset = xl
    static let controlInset = control
    static let large = xxl
    static let xLarge = xxxl
    static let xxLarge = section
    static let xxxLarge = screen
}
