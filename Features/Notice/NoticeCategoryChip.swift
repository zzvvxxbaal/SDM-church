import SwiftUI

struct NoticeCategoryChip: View {
    let title: String
    let selected: Bool

    var body: some View {
        Text(title)
            .font(.subheadline.weight(.semibold))
            .lineLimit(1)
            .minimumScaleFactor(0.8)
            .padding(.horizontal, AppSpacing.content)
            .padding(.vertical, AppSpacing.smPlus)
            .background(selected ? AppColors.tint.opacity(0.18) : .clear)
            .glass()
            .accessibilityElement(children: .combine)
            .accessibilityLabel(title)
            .accessibilityValue(selected ? "선택됨" : "선택 안 됨")
    }
}
