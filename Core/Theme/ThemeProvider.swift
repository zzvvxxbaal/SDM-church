import SwiftUI
import Observation

@Observable
final class ThemeProvider {
    
    var colorScheme: ColorScheme? = .light
    var isDarkMode: Bool = false
    
    func updateColorScheme(_ scheme: ColorScheme?) {
        colorScheme = scheme
        isDarkMode = scheme == .dark
    }
    
}
