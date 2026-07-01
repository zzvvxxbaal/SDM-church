import SwiftUI

struct FloatingActionButton: View {
    let systemImage: String
    let accessibilityLabel: String
    let accessibilityHint: String?
    let action: () -> Void

    @State private var isPressed = false

    init(
        systemImage: String,
        accessibilityLabel: String? = nil,
        accessibilityHint: String? = nil,
        action: @escaping () -> Void
    ) {
        self.systemImage = systemImage
        self.accessibilityLabel = accessibilityLabel ?? systemImage
        self.accessibilityHint = accessibilityHint
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(.title2)
                .frame(width: 64, height: 64)
                .accessibilityHidden(true)
        }
        .buttonStyle(.plain)
        .liquidGlass(.floating, cornerRadius: AppRadius.fab)
        .buttonPress(isPressed: isPressed, scale: 0.9, opacity: 0.8, hapticFeedback: true)
        .floating(offset: AppSpacing.xsWide, duration: 2.5)
        .onTouchDown { isPressed = true }
        .onTouchUp { isPressed = false }
        .accessibilityLabel(accessibilityLabel)
        .accessibilityHint(accessibilityHint ?? "버튼을 실행합니다")
        .accessibilityAddTraits(.isButton)
    }
}
