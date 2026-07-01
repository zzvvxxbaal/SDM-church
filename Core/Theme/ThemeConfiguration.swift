import SwiftUI

protocol ThemeConfiguration {
    var primaryColor: Color { get }
    var secondaryColor: Color { get }
    var backgroundColor: Color { get }
    var surfaceColor: Color { get }
    var textColor: Color { get }
    var accentColor: Color { get }
}

struct LightTheme: ThemeConfiguration {
    var primaryColor: Color { Color(red: 0.2, green: 0.4, blue: 0.8) }
    var secondaryColor: Color { Color(red: 0.1, green: 0.1, blue: 0.1) }
    var backgroundColor: Color { Color.white }
    var surfaceColor: Color { Color(red: 0.97, green: 0.97, blue: 0.98) }
    var textColor: Color { Color.black }
    var accentColor: Color { Color(red: 0.2, green: 0.4, blue: 0.8) }
}

struct DarkTheme: ThemeConfiguration {
    var primaryColor: Color { Color(red: 0.4, green: 0.6, blue: 1.0) }
    var secondaryColor: Color { Color.white }
    var backgroundColor: Color { Color.black }
    var surfaceColor: Color { Color(red: 0.17, green: 0.17, blue: 0.18) }
    var textColor: Color { Color.white }
    var accentColor: Color { Color(red: 0.4, green: 0.6, blue: 1.0) }
}

enum ThemeManager {
    
    private static var currentTheme: ThemeConfiguration = LightTheme()
    
    static func getTheme(for colorScheme: ColorScheme?) -> ThemeConfiguration {
        colorScheme == .dark ? DarkTheme() : LightTheme()
    }
    
    static func setTheme(_ theme: ThemeConfiguration) {
        currentTheme = theme
    }
    
}
