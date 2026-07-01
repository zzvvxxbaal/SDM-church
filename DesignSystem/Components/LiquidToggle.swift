import SwiftUI

struct LiquidToggle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label

            Spacer()

            RoundedRectangle(cornerRadius: AppRadius.lg)
                .fill(configuration.isOn ? AppColors.tint : AppColors.surfaceTertiary)
                .frame(width: 54, height: 32)
                .overlay(alignment: configuration.isOn ? .trailing : .leading) {
                    Circle()
                        .fill(AppColors.surface)
                        .padding(AppSpacing.micro)
                }
                .onTapGesture {
                    withAnimation(.snappy) {
                        configuration.isOn.toggle()
                    }
                }
        }
        .contentShape(Rectangle())
        .accessibilityElement(children: .combine)
        .accessibilityValue(configuration.isOn ? "켜짐" : "꺼짐")
    }
}
