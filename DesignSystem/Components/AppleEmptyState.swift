import SwiftUI

struct AppleEmptyState: View {
    let icon: String
    let title: String
    let subtitle: String?
    let actionTitle: String?
    let action: (() -> Void)?
    
    init(
        icon: String,
        title: String,
        subtitle: String? = nil,
        actionTitle: String? = nil,
        action: (() -> Void)? = nil
    ) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.actionTitle = actionTitle
        self.action = action
    }
    
    var body: some View {
        VStack(spacing: AppSpacing.large) {
            Spacer()
                .frame(height: AppSpacing.xxLarge)
            
            Image(systemName: icon)
                .font(.system(size: 56, weight: .thin))
                .foregroundStyle(AppColors.tint.opacity(0.6))
            
            VStack(spacing: AppSpacing.medium) {
                Text(title)
                    .font(.system(size: 20, weight: .semibold))
                    .multilineTextAlignment(.center)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.system(size: 15, weight: .regular))
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
            }
            
            if let actionTitle = actionTitle, let action = action {
                Button(action: action) {
                    Text(actionTitle)
                        .font(.system(size: 16, weight: .semibold))
                }
                .buttonStyle(LiquidButton())
                .padding(.horizontal, AppSpacing.large)
                .frame(height: 48)
            }
            
            Spacer()
                .frame(height: AppSpacing.xxLarge)
        }
        .frame(maxWidth: .infinity)
    }
}

struct AppleLoadingState: View {
    @State private var isAnimating = false
    
    let subtitle: String?
    
    init(subtitle: String? = nil) {
        self.subtitle = subtitle
    }
    
    var body: some View {
        VStack(spacing: AppSpacing.large) {
            Spacer()
                .frame(height: AppSpacing.xxLarge)
            
            VStack(spacing: AppSpacing.medium) {
                // Shimmer skeleton blocks
                SkeletonBlock()
                    .frame(height: 120)
                    .opacity(0.6)
                
                SkeletonBlock()
                    .frame(height: 80)
                    .opacity(0.5)
                
                SkeletonBlock()
                    .frame(height: 80)
                    .opacity(0.5)
            }
            .padding(AppSpacing.large)
            .liquidGlass(.card, cornerRadius: AppRadius.card)
            
            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
                .frame(height: AppSpacing.xxLarge)
        }
        .frame(maxWidth: .infinity)
        .opacity(isAnimating ? 1.0 : 0.7)
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                isAnimating = true
            }
        }
    }
}

private struct SkeletonBlock: View {
    @State private var isShimmering = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: AppRadius.medium)
            .fill(Color.gray.opacity(0.2))
            .shimmer(isActive: isShimmering)
            .onAppear {
                withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: false)) {
                    isShimmering = true
                }
            }
    }
}

struct ShimmerModifier: ViewModifier {
    let isActive: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isActive {
                LinearGradient(
                    gradient: Gradient(colors: [
                        .white.opacity(0),
                        .white.opacity(0.3),
                        .white.opacity(0)
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .offset(x: -200)
                .animation(
                    .linear(duration: 1.5).repeatForever(autoreverses: false),
                    value: isActive
                )
            }
        }
    }
}

extension View {
    func shimmer(isActive: Bool) -> some View {
        modifier(ShimmerModifier(isActive: isActive))
    }
}
