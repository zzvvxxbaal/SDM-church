import SwiftUI

struct LiquidIconButton: View {
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
                .font(.title3)
                .frame(width: 52, height: 52)
                .accessibilityHidden(true)
        }
        .buttonStyle(.plain)
        .liquidGlass(.button, cornerRadius: AppRadius.floating)
        .buttonPress(isPressed: isPressed, scale: 0.9, opacity: 0.8, hapticFeedback: true)
        .onTouchDown { isPressed = true }
        .onTouchUp { isPressed = false }
        .accessibilityLabel(accessibilityLabel)
        .accessibilityHint(accessibilityHint ?? "버튼을 실행합니다")
        .accessibilityAddTraits(.isButton)
    }
}
