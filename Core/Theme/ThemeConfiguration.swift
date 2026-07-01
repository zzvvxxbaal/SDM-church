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
    var primaryColor: Color { AppColors.tint }
    var secondaryColor: Color { AppColors.textSecondary }
    var backgroundColor: Color { AppColors.background }
    var surfaceColor: Color { AppColors.surfaceSecondary }
    var textColor: Color { AppColors.text }
    var accentColor: Color { AppColors.accent }
}

struct DarkTheme: ThemeConfiguration {
    var primaryColor: Color { AppColors.tint }
    var secondaryColor: Color { AppColors.textSecondary }
    var backgroundColor: Color { AppColors.background }
    var surfaceColor: Color { AppColors.surfaceSecondary }
    var textColor: Color { AppColors.text }
    var accentColor: Color { AppColors.accent }
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
