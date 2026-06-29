import SwiftUI

struct RootView: View {

    var body: some View {

        NavigationStack {

            LoginView()

        }

        .preferredColorScheme(.light)

        .tint(AppColors.tint)

    }

}

#Preview {

    RootView()

}