/// Metadata related to url context retrieval tool.
///
/// <https://ai.google.dev/api/live#urlcontextmetadata>
public struct UrlContextMetadata: Codable, Sendable {
    /// List of url context.
    public let urlMetadata: [UrlMetadata]
    
    public init(urlMetadata: [UrlMetadata]) {
        self.urlMetadata = urlMetadata
    }
}
