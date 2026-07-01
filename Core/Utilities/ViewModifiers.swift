import SwiftUI

extension View {
    
    @ViewBuilder
    func phoneOnly() -> some View {
        #if os(iPhone)
        self
        #endif
    }
    
    @ViewBuilder
    func padOnly() -> some View {
        #if os(iPad)
        self
        #endif
    }
    
    func withErrorHandling(_ errorHandler: @escaping (Error) -> Void) -> some View {
        self
    }
    
    func withLoadingState(_ isLoading: Bool) -> some View {
        self.opacity(isLoading ? 0.6 : 1.0)
            .disabled(isLoading)
    }
    
    func withDebugBorder(_ debug: Bool = false, color: Color = .red) -> some View {
        Group {
            if debug {
                self.border(color)
            } else {
                self
            }
        }
    }
    
    func safeAreaInsetBottom(_ value: CGFloat = 0) -> some View {
        self.padding(.bottom, value)
    }
    
}
