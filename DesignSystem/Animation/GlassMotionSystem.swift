import SwiftUI

struct GlassMotionSystem {
    struct PressAnimation {
        let scale: CGFloat
        let rotationX: Double
        let rotationY: Double
        let rotationZ: Double
        let animation: Animation
        
        init(
            scale: CGFloat = 0.965,
            rotationX: Double = 0.8,
            rotationY: Double = 0,
            rotationZ: Double = 0,
            animation: Animation = Springs.button
        ) {
            self.scale = scale
            self.rotationX = rotationX
            self.rotationY = rotationY
            self.rotationZ = rotationZ
            self.animation = animation
        }
        
        @ViewBuilder
        func view<Content: View>(
            pressed: Bool,
            @ViewBuilder content: () -> Content
        ) -> some View {
            PressAnimationView(
                pressed: pressed,
                scale: scale,
                rotationX: rotationX,
                rotationY: rotationY,
                rotationZ: rotationZ,
                animation: animation,
                content: content
            )
        }
    }
    
    struct HoverAnimation {
        let scale: CGFloat
        let elevation: CGFloat
        let animation: Animation
        
        init(
            scale: CGFloat = 1.02,
            elevation: CGFloat = 4,
            animation: Animation = Springs.card
        ) {
            self.scale = scale
            self.elevation = elevation
            self.animation = animation
        }
        
        @ViewBuilder
        func view<Content: View>(
            hovering: Bool,
            @ViewBuilder content: () -> Content
        ) -> some View {
            HoverAnimationView(
                hovering: hovering,
                scale: scale,
                elevation: elevation,
                animation: animation,
                content: content
            )
        }
    }
    
    struct ScrollAnimation {
        let parallaxStrength: CGFloat
        let animation: Animation
        
        init(
            parallaxStrength: CGFloat = 0.5,
            animation: Animation = .easeOut
        ) {
            self.parallaxStrength = parallaxStrength
            self.animation = animation
        }
    }
    
    struct FloatingAnimation {
        let offset: CGFloat
        let duration: Double
        let animation: Animation
        
        init(
            offset: CGFloat = 4,
            duration: Double = 2.0,
            animation: Animation = .easeInOut
        ) {
            self.offset = offset
            self.duration = duration
            self.animation = animation
        }
        
        @ViewBuilder
        func view<Content: View>(
            @ViewBuilder content: () -> Content
        ) -> some View {
            FloatingAnimationView(
                offset: offset,
                duration: duration,
                animation: animation,
                content: content
            )
        }
    }
    
    struct GlassMorphAnimation {
        let scale: CGFloat
        let rotation: Double
        let blur: CGFloat
        let animation: Animation
        
        init(
            scale: CGFloat = 0.95,
            rotation: Double = 2,
            blur: CGFloat = 2,
            animation: Animation = Springs.button
        ) {
            self.scale = scale
            self.rotation = rotation
            self.blur = blur
            self.animation = animation
        }
        
        @ViewBuilder
        func view<Content: View>(
            active: Bool,
            @ViewBuilder content: () -> Content
        ) -> some View {
            GlassMorphAnimationView(
                active: active,
                scale: scale,
                rotation: rotation,
                blur: blur,
                animation: animation,
                content: content
            )
        }
    }
}

struct PressAnimationView<Content: View>: View {
    let pressed: Bool
    let scale: CGFloat
    let rotationX: Double
    let rotationY: Double
    let rotationZ: Double
    let animation: Animation
    let content: () -> Content
    
    var body: some View {
        content()
            .scaleEffect(pressed ? scale : 1.0)
            .rotation3DEffect(
                .degrees(pressed ? rotationX : 0),
                axis: (x: 1, y: 0, z: 0)
            )
            .rotation3DEffect(
                .degrees(pressed ? rotationY : 0),
                axis: (x: 0, y: 1, z: 0)
            )
            .rotation3DEffect(
                .degrees(pressed ? rotationZ : 0),
                axis: (x: 0, y: 0, z: 1)
            )
            .animation(animation, value: pressed)
    }
}

struct HoverAnimationView<Content: View>: View {
    let hovering: Bool
    let scale: CGFloat
    let elevation: CGFloat
    let animation: Animation
    let content: () -> Content
    
    var body: some View {
        content()
            .scaleEffect(hovering ? scale : 1.0)
            .offset(y: hovering ? -elevation : 0)
            .shadow(
                color: Color.black.opacity(hovering ? 0.15 : 0.08),
                radius: hovering ? 12 : 8,
                x: 0,
                y: hovering ? 6 : 2
            )
            .animation(animation, value: hovering)
    }
}

struct FloatingAnimationView<Content: View>: View {
    let offset: CGFloat
    let duration: Double
    let animation: Animation
    let content: () -> Content
    
    @State private var isFloating = false
    
    var body: some View {
        content()
            .offset(y: isFloating ? offset : -offset)
            .animation(
                animation(duration: duration).repeatForever(autoreverses: true),
                value: isFloating
            )
            .onAppear {
                isFloating = true
            }
    }
}

struct GlassMorphAnimationView<Content: View>: View {
    let active: Bool
    let scale: CGFloat
    let rotation: Double
    let blur: CGFloat
    let animation: Animation
    let content: () -> Content
    
    var body: some View {
        content()
            .scaleEffect(active ? scale : 1.0)
            .rotation3DEffect(
                .degrees(active ? rotation : 0),
                axis: (x: 1, y: 1, z: 0)
            )
            .blur(radius: active ? blur : 0)
            .animation(animation, value: active)
    }
}

extension View {
    func pressAnimation(
        pressed: Bool,
        scale: CGFloat = 0.965,
        rotation: Double = 0.8
    ) -> some View {
        GlassMotionSystem.PressAnimation(
            scale: scale,
            rotationX: rotation
        ).view(pressed: pressed) {
            self
        }
    }
    
    func hoverAnimation(
        hovering: Bool,
        scale: CGFloat = 1.02,
        elevation: CGFloat = 4
    ) -> some View {
        GlassMotionSystem.HoverAnimation(
            scale: scale,
            elevation: elevation
        ).view(hovering: hovering) {
            self
        }
    }
    
    func floatingAnimation(
        offset: CGFloat = 4,
        duration: Double = 2.0
    ) -> some View {
        GlassMotionSystem.FloatingAnimation(
            offset: offset,
            duration: duration
        ).view {
            self
        }
    }
    
    func glassMorphAnimation(
        active: Bool,
        scale: CGFloat = 0.95,
        rotation: Double = 2
    ) -> some View {
        GlassMotionSystem.GlassMorphAnimation(
            scale: scale,
            rotation: rotation
        ).view(active: active) {
            self
        }
    }
}
