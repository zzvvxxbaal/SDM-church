var body: some View {

    Button(
        action: action
    ) {

        Image(
            systemName: systemImage
        )

        .font(
            .title3.weight(.semibold)
        )

        .frame(
            width: 48,
            height: 48
        )

    }

    .buttonStyle(
        PlainButtonStyle()
    )

    .glass(.button)

}