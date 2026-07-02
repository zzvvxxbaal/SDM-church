var body: some View {

    configuration.label

        .font(.headline)

        .foregroundStyle(.primary)

        .frame(
            maxWidth: .infinity
        )

        .padding(.vertical, 16)

        .glass(.button)

        .scaleEffect(
            configuration.isPressed
            ? 0.97
            : 1
        )

        .animation(
            .snappy(
                duration: 0.22
            ),
            value: configuration.isPressed
        )

}