import SwiftUI

// MARK: - Content Depth & Floating Effects

struct FloatingCardEffect: ViewModifier {
    @State private var isHovering = false
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isHovering ? 1.02 : 1.0)
            .shadow(
                color: Color.black.opacity(isHovering ? 0.15 : 0.08),
                radius: isHovering ? 16 : 8,
                x: 0,
                y: isHovering ? 12 : 4
            )
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isHovering)
            .onHover { hovering in
                isHovering = hovering
            }
    }
}

extension View {
    func floatingCardEffect() -> some View {
        modifier(FloatingCardEffect())
    }
}

// MARK: - Subtle Animations

struct SubtleOpacityOnScroll: ViewModifier {
    let scrollOffset: CGFloat
    let threshold: CGFloat
    
    var opacity: Double {
        let normalized = min(1, max(0, scrollOffset / threshold))
        return Double(1 - normalized * 0.3)
    }
    
    func body(content: Content) -> some View {
        content
            .opacity(opacity)
    }
}

extension View {
    func subtleOpacityOnScroll(offset: CGFloat, threshold: CGFloat = 100) -> some View {
        modifier(SubtleOpacityOnScroll(scrollOffset: offset, threshold: threshold))
    }
}

// MARK: - Content Clipping Animation

struct ClippingMaskEffect: ViewModifier {
    let isVisible: Bool
    let animation: Animation
    
    func body(content: Content) -> some View {
        content
            .mask(
                RoundedRectangle(cornerRadius: AppRadius.card)
                    .scaleEffect(isVisible ? 1 : 0.8, anchor: .center)
                    .opacity(isVisible ? 1 : 0)
                    .animation(animation, value: isVisible)
            )
    }
}

extension View {
    func clippingMask(
        isVisible: Bool,
        animation: Animation = .spring(response: 0.4, dampingFraction: 0.8)
    ) -> some View {
        modifier(ClippingMaskEffect(isVisible: isVisible, animation: animation))
    }
}

// MARK: - Shine Effect

struct ShineEffect: ViewModifier {
    @State private var isShining = false
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isShining {
                LinearGradient(
                    gradient: Gradient(colors: [
                        .white.opacity(0),
                        .white.opacity(0.3),
                        .white.opacity(0)
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .offset(x: isShining ? 500 : -500)
                .animation(
                    .linear(duration: 1.5).repeatForever(autoreverses: false),
                    value: isShining
                )
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isShining = true
            }
        }
    }
}

extension View {
    func shineEffect() -> some View {
        modifier(ShineEffect())
    }
}

// MARK: - Bounce Animation

struct BounceEffect: ViewModifier {
    @State private var isBouncing = false
    let initialDelay: Double
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isBouncing ? 1.0 : 0.95)
            .animation(
                Animation.spring(response: 0.5, dampingFraction: 0.6)
                    .repeatForever(autoreverses: true)
                    .delay(initialDelay),
                value: isBouncing
            )
            .onAppear {
                isBouncing = true
            }
    }
}

extension View {
    func bounceEffect(delay: Double = 0) -> some View {
        modifier(BounceEffect(initialDelay: delay))
    }
}

// MARK: - Apple-Style Badge

struct AppleBadge: View {
    let text: String
    let color: Color
    let icon: String?
    
    var body: some View {
        HStack(spacing: AppSpacing.xSmall) {
            if let icon = icon {
                Image(systemName: icon)
                    .font(.system(size: 10, weight: .bold))
            }
            
            Text(text)
                .font(.system(size: 11, weight: .semibold))
        }
        .foregroundStyle(.white)
        .padding(.horizontal, AppSpacing.small)
        .padding(.vertical, 4)
        .background(color)
        .cornerRadius(AppRadius.small)
    }
}

// MARK: - Apple-Style Divider with Label

struct LabeledDivider: View {
    let text: String
    let color: Color
    
    var body: some View {
        HStack(spacing: AppSpacing.medium) {
            VStack {
                Divider()
            }
            
            Text(text)
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(color)
            
            VStack {
                Divider()
            }
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Apple-Style Stat Display

struct StatDisplay: View {
    let value: String
    let label: String
    let icon: String?
    let color: Color
    
    var body: some View {
        VStack(alignment: .center, spacing: AppSpacing.small) {
            if let icon = icon {
                Image(systemName: icon)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(color)
            }
            
            VStack(alignment: .center, spacing: 2) {
                Text(value)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(color)
                
                Text(label)
                    .font(.system(size: 11, weight: .regular))
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(AppSpacing.medium)
        .liquidGlass(.card, cornerRadius: AppRadius.card)
    }
}

// MARK: - Apple-Style Info Block

struct InfoBlock: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    let action: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.small) {
            HStack(spacing: AppSpacing.small) {
                Image(systemName: icon)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(color)
                
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
            }
            
            Text(subtitle)
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(.secondary)
                .lineLimit(2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(AppSpacing.medium)
        .liquidGlass(.card, cornerRadius: AppRadius.card)
        .onTapGesture {
            action?()
        }
    }
}

// MARK: - Apple-Style Call-to-Action Row

struct CTARow: View {
    let title: String
    let subtitle: String?
    let icon: String?
    let action: (() -> Void)?
    let trailing: String?
    
    var body: some View {
        Button(action: { action?() }) {
            HStack(spacing: AppSpacing.medium) {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(AppColors.tint)
                        .frame(width: 32, alignment: .center)
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.primary)
                    
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(.system(size: 12, weight: .regular))
                            .foregroundStyle(.secondary)
                    }
                }
                
                Spacer()
                
                if let trailing = trailing {
                    Text(trailing)
                        .font(.system(size: 13, weight: .regular))
                        .foregroundStyle(.secondary)
                }
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.tertiary)
            }
            .padding(AppSpacing.medium)
            .liquidGlass(.card, cornerRadius: AppRadius.card)
        }
    }
}
