import SwiftUI

public struct AppleTransitionModifier: ViewModifier {
    let transition: NavigationTransition
    let isPresented: Bool
    
    public func body(content: Content) -> some View {
        switch transition {
        case .push:
            content.transition(.asymmetric(
                insertion: .move(edge: .trailing).combined(with: .opacity),
                removal: .move(edge: .leading).combined(with: .opacity)
            ))
        case .modal:
            content.transition(.asymmetric(
                insertion: .move(edge: .bottom).combined(with: .opacity),
                removal: .move(edge: .bottom).combined(with: .opacity)
            ))
        case .sheet:
            content.transition(.move(edge: .bottom))
        case .custom(let name):
            content.transition(.asymmetric(
                insertion: .opacity,
                removal: .opacity
            ))
        }
    }
}

public struct ModalPresentationStyle: ViewModifier {
    let style: PresentationStyle
    @State private var isDragging = false
    @State private var dragOffset: CGFloat = 0
    
    public func body(content: Content) -> some View {
        switch style {
        case .sheet:
            content
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        case .fullScreenCover:
            content
        case .dialog:
            content
                .frame(maxWidth: 300)
                .background(Color(.systemBackground))
                .cornerRadius(12)
                .shadow(radius: 20)
        case .alert:
            content
        case .confirmationDialog:
            content
        case .bottomSheet:
            content
                .presentationDetents([.fraction(0.4), .large])
                .presentationDragIndicator(.visible)
        }
    }
}

public struct InteractiveDismissGesture: ViewModifier {
    @State private var offset: CGFloat = 0
    @State private var isDragging = false
    let onDismiss: () -> Void
    
    public func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture()
                    .onChanged { value in
                        offset = value.translation.height
                        isDragging = true
                    }
                    .onEnded { value in
                        isDragging = false
                        if value.translation.height > 100 {
                            withAnimation(.easeOut(duration: 0.3)) {
                                onDismiss()
                            }
                        } else {
                            withAnimation(.spring()) {
                                offset = 0
                            }
                        }
                    }
            )
            .offset(y: max(0, offset))
    }
}

public struct HeroTransitionManager {
    let sourceNamespace: Namespace.ID
    let destinationNamespace: Namespace.ID
    
    public init(
        source: Namespace.ID,
        destination: Namespace.ID
    ) {
        self.sourceNamespace = source
        self.destinationNamespace = destination
    }
}

public struct NavigationTransitionModifier: ViewModifier {
    let transition: NavigationTransition
    @Environment(\.isPresented) var isPresented
    
    public func body(content: Content) -> some View {
        if #available(iOS 18, *) {
            content
                .navigationTransition(.zoom.combined(with: .fade(.in)))
        } else {
            content
        }
    }
}

public extension View {
    func appleTransition(_ transition: NavigationTransition) -> some View {
        modifier(AppleTransitionModifier(transition: transition, isPresented: false))
    }
    
    func modalPresentationStyle(_ style: PresentationStyle) -> some View {
        modifier(ModalPresentationStyle(style: style))
    }
    
    func interactiveDismiss(onDismiss: @escaping () -> Void) -> some View {
        modifier(InteractiveDismissGesture(onDismiss: onDismiss))
    }
    
    func navigationTransition(_ transition: NavigationTransition) -> some View {
        modifier(NavigationTransitionModifier(transition: transition))
    }
}

public struct AppleAnimationManager {
    public static let standardDuration: TimeInterval = 0.3
    public static let springAnimation = Animation.spring(
        response: 0.5,
        dampingFraction: 0.75,
        blendDuration: 0.1
    )
    
    public static let easeInOutAnimation = Animation.easeInOut(duration: standardDuration)
    
    public static let pushAnimation = Animation.easeOut(duration: standardDuration)
    
    public static let popAnimation = Animation.easeOut(duration: standardDuration)
    
    public static let modalAnimation = Animation.easeInOut(duration: standardDuration)
}
