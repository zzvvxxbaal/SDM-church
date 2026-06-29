import SwiftUI

struct LoginView: View {

    @State
    private var viewModel = AuthenticationViewModel()

    var body: some View {

        ZStack {

            AppColors.background

                .ignoresSafeArea()

            ScrollView(.vertical, showsIndicators: false) {

                VStack(spacing: 36) {

                    Spacer()

                    VStack(spacing: 10) {

                        Text("서대문교회")

                            .font(AppFonts.hero)

                        Text("청년부")

                            .font(AppFonts.headline)

                            .foregroundStyle(.secondary)

                    }

                    VStack(spacing: 18) {

                        LiquidTextField(

                            title: "이메일",

                            text: $viewModel.email,

                            systemImage: "envelope"

                        )

                        LiquidSecureField(

                            title: "비밀번호",

                            text: $viewModel.password

                        )

                    }

                    VStack(spacing: 18) {

                        Button {

                        } label: {

                            Text("로그인")

                        }

                        .buttonStyle(LiquidButton())

                        Button {

                        } label: {

                            Label("Google로 계속하기", systemImage: "globe")

                        }

                        .buttonStyle(LiquidButton())

                        Button {

                        } label: {

                            Text("카카오로 계속하기")

                        }

                        .buttonStyle(LiquidButton())

                        Button {

                        } label: {

                            Text("회원가입")

                        }

                        .buttonStyle(LiquidButton())

                    }

                }

                .padding(.horizontal,24)

                .padding(.vertical,50)

            }

        }

    }

}

#Preview {

    LoginView()

}