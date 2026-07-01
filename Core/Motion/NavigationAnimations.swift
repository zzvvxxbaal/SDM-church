import SwiftUI

// MARK: - Push Navigation Transition

public struct PushNavigationTransition: ViewModifier {
    let isActive: Bool
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(isActive: Bool) {
        self.isActive = isActive
    }
    
    public func body(content: Content) -> some View {
        content
            .offset(x: isActive ? 0 : UIScreen.main.bounds.width)
            .opacity(isActive ? 1 : 0)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.5, dampingFraction: 0.85),
                value: isActive
            )
    }
}

// MARK: - Pop Navigation Transition

public struct PopNavigationTransition: ViewModifier {
    let isActive: Bool
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(isActive: Bool) {
        self.isActive = isActive
    }
    
    public func body(content: Content) -> some View {
        content
            .offset(x: isActive ? 0 : -UIScreen.main.bounds.width)
            .opacity(isActive ? 1 : 0)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.5, dampingFraction: 0.85),
                value: isActive
            )
    }
}

// MARK: - Sheet Presentation Transition

public struct SheetPresentationTransition: ViewModifier {
    let isPresented: Bool
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(isPresented: Bool) {
        self.isPresented = isPresented
    }
    
    public func body(content: Content) -> some View {
        content
            .offset(y: isPresented ? 0 : UIScreen.main.bounds.height)
            .opacity(isPresented ? 1 : 0)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.5, dampingFraction: 0.85),
                value: isPresented
            )
    }
}

// MARK: - Full Screen Presentation Transition

public struct FullScreenPresentationTransition: ViewModifier {
    let isPresented: Bool
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(isPresented: Bool) {
        self.isPresented = isPresented
    }
    
    public func body(content: Content) -> some View {
        content
            .opacity(isPresented ? 1 : 0)
            .scaleEffect(isPresented ? 1 : 0.95)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.6, dampingFraction: 0.85),
                value: isPresented
            )
    }
}

// MARK: - Bottom Sheet Presentation Transition

public struct BottomSheetPresentationTransition: ViewModifier {
    let isPresented: Bool
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(isPresented: Bool) {
        self.isPresented = isPresented
    }
    
    public func body(content: Content) -> some View {
        content
            .offset(y: isPresented ? 0 : UIScreen.main.bounds.height * 0.6)
            .opacity(isPresented ? 1 : 0)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.5, dampingFraction: 0.85),
                value: isPresented
            )
    }
}

// MARK: - Hero Transition

public struct HeroTransitionAnimation: ViewModifier {
    let isActive: Bool
    let scale: CGFloat
    
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    public init(isActive: Bool, scale: CGFloat = 1.1) {
        self.isActive = isActive
        self.scale = scale
    }
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(isActive ? scale : 1.0)
            .animation(
                reduceMotion ? .linear(duration: 0.01) : .spring(response: 0.6, dampingFraction: 0.85),
                value: isActive
            )
    }
}

// MARK: - Shared Element Transition

public struct SharedElementTransitionAnimation: ViewModifier {
    let isActive: Bool
    let namespace: Namespace.ID
    let id: String
    
    public init(isActive: Bool, namespace: Namespace.ID, id: String) {
        self.isActive = isActive
        self.namespace = namespace
        self.id = id
    }
    
    public func body(content: Content) -> some View {
        content
            .matchedGeometryEffect(id: id, in: namespace)
    }
}

// MARK: - Navigation Transition Wrapper

public struct NavigationTransition {
    public enum Style {
        case push
        case pop
        case sheet
        case fullScreen
        case bottomSheet
        case hero
    }
    
    public static func transition(
        style: Style,
        isActive: Bool
    ) -> AnyTransition {
        switch style {
        case .push:
            return AnyTransition.asymmetric(
                insertion: .move(edge: .trailing).combined(with: .opacity),
                removal: .move(edge: .leading).combined(with: .opacity)
            )
        case .pop:
            return AnyTransition.asymmetric(
                insertion: .move(edge: .leading).combined(with: .opacity),
                removal: .move(edge: .trailing).combined(with: .opacity)
            )
        case .sheet:
            return AnyTransition.asymmetric(
                insertion: .move(edge: .bottom).combined(with: .opacity),
                removal: .move(edge: .bottom).combined(with: .opacity)
            )
        case .fullScreen:
            return AnyTransition.opacity.combined(with: .scale(scale: 0.95))
        case .bottomSheet:
            return AnyTransition.asymmetric(
                insertion: .move(edge: .bottom).combined(with: .opacity),
                removal: .move(edge: .bottom).combined(with: .opacity)
            )
        case .hero:
            return AnyTransition.scale.combined(with: .opacity)
        }
    }
}

// MARK: - View Extensions

extension View {
    public func pushNavigation(isActive: Bool) -> some View {
        modifier(PushNavigationTransition(isActive: isActive))
    }
    
    public func popNavigation(isActive: Bool) -> some View {
        modifier(PopNavigationTransition(isActive: isActive))
    }
    
    public func sheetPresentation(isPresented: Bool) -> some View {
        modifier(SheetPresentationTransition(isPresented: isPresented))
    }
    
    public func fullScreenPresentation(isPresented: Bool) -> some View {
        modifier(FullScreenPresentationTransition(isPresented: isPresented))
    }
    
    public func bottomSheetPresentation(isPresented: Bool) -> some View {
        modifier(BottomSheetPresentationTransition(isPresented: isPresented))
    }
    
    public func heroTransition(isActive: Bool, scale: CGFloat = 1.1) -> some View {
        modifier(HeroTransitionAnimation(isActive: isActive, scale: scale))
    }
}
