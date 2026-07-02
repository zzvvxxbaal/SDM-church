import SwiftUI

struct RegisterView: View {

    @State private var name = ""

    @State private var email = ""

    @State private var password = ""

    var body: some View {

        ZStack {

            MeshGradientBackground()

            ScrollView {

                VStack(spacing: 24) {

                    LiquidLargeTitle(

                        title: "회원가입",

                        subtitle: "Register"

                    )

                    LiquidTextField(

                        title: "이름",

                        text: $name

                    )

                    LiquidTextField(

                        title: "이메일",

                        text: $email

                    )

                    LiquidSecureField(

                        title: "비밀번호",

                        text: $password

                    )

                    LiquidButton("회원가입") {

                    }

                }

                .padding(24)

            }

        }

    }

}