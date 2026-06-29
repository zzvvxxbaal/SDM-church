import SwiftUI

struct LoginView: View {

    var body: some View {

        ZStack {

            AppColors.background

                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(spacing: 32) {

                    Spacer()

                    VStack(spacing: 10) {

                        Text("서대문교회")

                            .font(AppFonts.hero)

                        Text("청년부")

                            .font(AppFonts.headline)

                            .foregroundStyle(.secondary)

                    }

                    Spacer()

                    VStack(spacing: 18) {

                        Button {

                        } label: {

                            Text("이메일로 계속하기")

                        }

                        .buttonStyle(LiquidButton())

                        Button {

                        } label: {

                            Text("Google로 계속하기")

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

                .padding(.vertical,40)

            }

        }

    }

}

#Preview {

    LoginView()

}