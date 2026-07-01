import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""

    var body: some View {
        ScrollView {
            LazyVStack(spacing: AppSpacing.inset) {
                Text("회원가입")
                    .font(AppFonts.largeTitle)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)

                LiquidTextField(
                    title: "이름",
                    text: $name,
                    systemImage: "person"
                )

                LiquidTextField(
                    title: "이메일",
                    text: $email,
                    systemImage: "envelope"
                )

                LiquidSecureField(
                    title: "비밀번호",
                    text: $password
                )

                Button {
                } label: {
                    Text("가입하기")
                }
                .buttonStyle(LiquidButton())
                .accessibilityLabel("가입하기")
                .accessibilityHint("입력한 정보로 계정을 생성합니다")
                .accessibilityAddTraits(.isButton)
            }
            .padding(AppSpacing.large)
        }
        .background(
            AppColors.background
                .ignoresSafeArea()
        )
    }
}

#Preview {
    RegisterView()
}
