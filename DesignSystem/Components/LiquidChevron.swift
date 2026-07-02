import SwiftUI

struct LiquidChevron: View {

    var body: some View {

        Image(systemName: "chevron.right")

            .font(.headline.weight(.semibold))

            .foregroundStyle(

                AppColors.textSecondary

            )

    }

}
