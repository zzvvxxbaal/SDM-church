import SwiftUI

struct PrayerInputCard: View {
    @State private var prayer = ""

    var body: some View {
        LiquidCard {
            Text("기도제목 작성")
                .font(AppFonts.headline)
                .accessibilityAddTraits(.isHeader)

            TextEditor(text: $prayer)
                .frame(minHeight: AppSpacing.section * 2 + AppSpacing.content)
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .accessibilityLabel("기도제목")
                .accessibilityHint("나누고 싶은 기도제목을 입력합니다")

            Button {
            } label: {
                Text("등록")
            }
            .buttonStyle(LiquidButton())
            .accessibilityLabel("등록")
            .accessibilityHint("기도제목을 저장합니다")
            .accessibilityAddTraits(.isButton)
        }
    }
}
