import SwiftUI

public struct ButtonView<Label: View>: View {
    public enum Size {
        case small
        case large

        var controlSize: ControlSize {
            switch self {
            case .small: return .small
            case .large: return .extraLarge
            }
        }

        var font: Font {
            switch self {
            case .small: return .subheadline.bold()
            case .large: return .body.bold()
            }
        }
    }

    private let size: Size
    private let action: () -> Void
    private let label: Label

    // Public Initializer for Package use
    public init(
        size: Size,
        action: @escaping () -> Void,
        @ViewBuilder label: () -> Label
    ) {
        self.size = size
        self.action = action
        self.label = label()
    }

    public var body: some View {
        Button(action: action) {
            label
                // "Large" flexes to fill width, "Small" stays nil (hugging)
                .frame(maxWidth: size == .large ? .infinity : nil)
        }
        .controlSize(size.controlSize)
        .font(size.font)
    }
}

// MARK: - Preview
#Preview {
    VStack(alignment: .leading, spacing: 20) {
        // Large Button - Flexes full width
        ButtonView(size: .large) {
            print("Large Tapped")
        } label: {
            Label("Full Width Label", systemImage: "star.fill")
        }
        .buttonStyle(.borderedProminent)

        // Small Button - Hugs content
        ButtonView(size: .small) {
            print("Small Tapped")
        } label: {
            Text("Small")
        }
        .buttonStyle(.borderedProminent)

        Spacer()
    }
    .padding()
}
