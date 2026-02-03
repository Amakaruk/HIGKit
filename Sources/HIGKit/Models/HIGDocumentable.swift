import SwiftUI

/// The "Handshake" protocol that allows the Library to feed
/// documentation data to the Sample App.
public protocol HIGDocumentable {
    /// The display name of the component (e.g., "Primary Button")
    var title: String { get }

    /// The HIG-based explanation of when and how to use it
    var description: String { get }

    /// A collection of examples, their code snippets, and the live preview
    /// formatted as: (Label, Code String, Live View)
    var variants: [(label: String, code: String, view: AnyView)] { get }
}
