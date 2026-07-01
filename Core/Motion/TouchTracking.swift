import SwiftUI

// MARK: - Touch Tracking Modifiers

extension View {
    /// Detects when the view is being touched down
    public func onTouchDown(perform action: @escaping () -> Void) -> some View {
        modifier(TouchDownModifier(action: action))
    }
    
    /// Detects when the view is being released
    public func onTouchUp(perform action: @escaping () -> Void) -> some View {
        modifier(TouchUpModifier(action: action))
    }
}

// MARK: - Touch Down Modifier

struct TouchDownModifier: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        action()
                    }
            )
    }
}

// MARK: - Touch Up Modifier

struct TouchUpModifier: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onEnded { _ in
                        action()
                    }
            )
    }
}
