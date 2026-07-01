import SwiftUI

struct LoginView: View {
    @State private var viewModel = AuthenticationViewModel()

    var body: some View {
        ZStack {
            AppColors.background
                .ignoresSafeArea()

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: AppSpacing.xLarge) {
                    Spacer()

                    VStack(spacing: AppSpacing.compact) {
                        Text("서대문교회")
                            .font(.largeTitle.weight(.bold))
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)

                        Text("청년부")
                            .font(.headline)
                            .foregroundStyle(AppColors.textSecondary)
                    }

                    VStack(spacing: AppSpacing.large) {
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

                    VStack(spacing: AppSpacing.large) {
                        Button {
                        } label: {
                            Text("로그인")
                        }
                        .buttonStyle(LiquidButton())
                        .accessibilityLabel("로그인")
                        .accessibilityHint("입력한 계정으로 로그인합니다")

                        Button {
                        } label: {
                            Label("Google로 계속하기", systemImage: "globe")
                        }
                        .buttonStyle(LiquidButton())
                        .accessibilityLabel("Google로 계속하기")
                        .accessibilityHint("Google 계정으로 로그인합니다")

                        Button {
                        } label: {
                            Text("카카오로 계속하기")
                        }
                        .buttonStyle(LiquidButton())
                        .accessibilityLabel("카카오로 계속하기")
                        .accessibilityHint("카카오 계정으로 로그인합니다")

                        Button {
                        } label: {
                            Text("회원가입")
                        }
                        .buttonStyle(LiquidButton())
                        .accessibilityLabel("회원가입")
                        .accessibilityHint("새 계정을 만듭니다")
                    }
                }
                .padding(.horizontal, AppSpacing.large)
                .padding(.vertical, AppSpacing.xxxLarge)
            }
        }
    }
}

#Preview {
    LoginView()
}
