import SwiftUI

public struct BackSwipeGestureModifier: ViewModifier {
    let onBackSwipe: () -> Void
    @State private var isDragging = false
    @State private var dragTranslation: CGFloat = 0
    
    private let swipeThreshold: CGFloat = 100
    
    public func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if value.startLocation.x < 50 && !isDragging {
                            isDragging = true
                        }
                        if isDragging {
                            dragTranslation = value.translation.width
                        }
                    }
                    .onEnded { value in
                        if isDragging && dragTranslation > swipeThreshold {
                            withAnimation(.easeOut(duration: 0.3)) {
                                onBackSwipe()
                            }
                        } else {
                            withAnimation(.spring()) {
                                dragTranslation = 0
                            }
                        }
                        isDragging = false
                    }
            )
            .offset(x: isDragging ? dragTranslation : 0)
    }
}

public struct GestureRecognizer: UIViewControllerRepresentable {
    let onGestureRecognized: () -> Void
    
    public func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        let gesture = UISwipeGestureRecognizer(
            target: context.coordinator,
            action: #selector(Coordinator.handleSwipe)
        )
        gesture.direction = .right
        controller.view.addGestureRecognizer(gesture)
        return controller
    }
    
    public func updateUIViewController(
        _ uiViewController: UIViewController,
        context: Context
    ) {}
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(onGestureRecognized: onGestureRecognized)
    }
    
    public class Coordinator: NSObject {
        let onGestureRecognized: () -> Void
        
        init(onGestureRecognized: @escaping () -> Void) {
            self.onGestureRecognized = onGestureRecognized
        }
        
        @objc func handleSwipe() {
            onGestureRecognized()
        }
    }
}

public struct InteractiveGestureSupport: ViewModifier {
    let onPan: (CGFloat) -> Void
    let onSwipe: () -> Void
    
    @State private var isDragging = false
    @State private var dragOffset: CGFloat = 0
    
    public func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture()
                    .onChanged { value in
                        isDragging = true
                        dragOffset = value.translation.width
                        onPan(dragOffset)
                    }
                    .onEnded { value in
                        isDragging = false
                        if value.translation.width > 100 {
                            onSwipe()
                        }
                        withAnimation(.spring()) {
                            dragOffset = 0
                        }
                    }
            )
    }
}

public struct InteractiveDismissModifier: ViewModifier {
    @State private var dragOffset: CGFloat = 0
    @State private var isDragging = false
    let onDismiss: () -> Void
    
    private let dismissThreshold: CGFloat = 150
    private let velocityThreshold: CGFloat = 1000
    
    public func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if !isDragging {
                            isDragging = true
                        }
                        dragOffset = value.translation.height
                    }
                    .onEnded { value in
                        isDragging = false
                        let velocity = value.predictedEndLocation.y - value.location.y
                        
                        if dragOffset > dismissThreshold || velocity > velocityThreshold {
                            withAnimation(.easeOut(duration: 0.3)) {
                                onDismiss()
                            }
                        } else {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                dragOffset = 0
                            }
                        }
                    }
            )
            .offset(y: max(0, dragOffset))
            .opacity(1 - (dragOffset / 500))
    }
}

public extension View {
    func backSwipeGesture(_ action: @escaping () -> Void) -> some View {
        modifier(BackSwipeGestureModifier(onBackSwipe: action))
    }
    
    func interactiveGesture(
        onPan: @escaping (CGFloat) -> Void = { _ in },
        onSwipe: @escaping () -> Void = {}
    ) -> some View {
        modifier(InteractiveGestureSupport(onPan: onPan, onSwipe: onSwipe))
    }
    
    func interactiveDismiss(_ action: @escaping () -> Void) -> some View {
        modifier(InteractiveDismissModifier(onDismiss: action))
    }
}
