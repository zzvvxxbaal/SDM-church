import SwiftUI

struct LiquidNavigationBar: View {

    let title: String

    var body: some View {

        HStack {

            Text(title)

                .font(AppFonts.title)

                .bold()

            Spacer()

            Image(systemName: "bell")

                .font(.title3)

        }

        .padding(.horizontal,24)

        .frame(height:64)

        .liquidGlass(.navigation, cornerRadius: AppRadius.sheet)

    }

}

#Preview {

    LiquidNavigationBar(title: "홈")

}