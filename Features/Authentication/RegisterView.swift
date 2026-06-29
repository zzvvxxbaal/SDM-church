import SwiftUI

struct RegisterView: View {

    @State
    private var email = ""

    @State
    private var password = ""

    @State
    private var name = ""

    var body: some View {

        ScrollView {

            VStack(spacing:20) {

                Text("회원가입")

                    .font(AppFonts.hero)

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

            }

            .padding(24)

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