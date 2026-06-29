import SwiftUI

struct RootView: View {

    var body: some View {

        NavigationStack {

            HomeView()

        }

        .preferredColorScheme(.light)

        .tint(AppColors.tint)

    }

}

#Preview {

    RootView()

}