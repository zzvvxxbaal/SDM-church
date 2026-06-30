import SwiftUI

struct NoticeCategoryChip: View {

    let title: String

    let selected: Bool

    var body: some View {

        Text(title)

            .font(.subheadline.weight(.semibold))

            .padding(.horizontal, 18)

            .padding(.vertical, 10)

            .background(

                selected

                ? AppColors.tint.opacity(0.18)

                : .clear

            )

            .glass()

    }

}