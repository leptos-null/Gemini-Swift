/// The base structured datatype containing multi-part content of a message.
///
/// A `Content` includes a ``role`` field designating the producer of the `Content` and a ``parts`` field containing multi-part data that contains the content of the message turn.
///
/// <https://ai.google.dev/api/caching#Content>
public struct Content: Codable, Sendable {
    /// Ordered `Parts` that constitute a single message.
    ///
    /// Parts may have different MIME types.
    public let parts: [Part]
    /// The producer of the content. Must be either 'user' or 'model'.
    ///
    /// Useful to set for multi-turn conversations, otherwise can be left blank or unset.
    public let role: String?
    
    public init(parts: [Part], role: String?) {
        self.parts = parts
        self.role = role
    }
}
