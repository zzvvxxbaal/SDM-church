import SwiftUI

struct LoginView: View {

    var body: some View {

        ZStack {

            MeshGradientBackground()

            VStack(spacing: 28) {

                Spacer()

                VStack(spacing: 16) {

                    Image(systemName: "church.fill")

                        .font(.system(size: 64))

                        .foregroundStyle(AppColors.accent)

                    Text("서대문교회")

                        .font(AppFonts.extraLargeTitle)

                        .fontWeight(.bold)

                    Text("청년부")

                        .font(AppFonts.title3)

                        .foregroundStyle(AppColors.textSecondary)

                }

                Spacer()

                VStack(spacing: 16) {

                    LiquidLoginButton(

                        title: "Apple로 계속하기",

                        systemImage: "apple.logo"

                    )

                    LiquidLoginButton(

                        title: "카카오로 계속하기",

                        systemImage: "message.fill"

                    )

                    LiquidLoginButton(

                        title: "Google로 계속하기",

                        systemImage: "globe"

                    )

                    LiquidLoginButton(

                        title: "이메일로 로그인",

                        systemImage: "envelope.fill"

                    )

                }

                Spacer()

            }

            .padding(24)

        }

    }

}

#Preview {

    LoginView()

}