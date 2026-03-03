/// Context of a single url retrieval.
///
/// <https://ai.google.dev/api/generate-content#UrlMetadata>
public struct UrlMetadata: Codable, Sendable {
    /// Retrieved url by the tool.
    public let retrievedUrl: String
    /// Status of the url retrieval.
    public let urlRetrievalStatus: UrlRetrievalStatus
    
    public init(retrievedUrl: String, urlRetrievalStatus: UrlRetrievalStatus) {
        self.retrievedUrl = retrievedUrl
        self.urlRetrievalStatus = urlRetrievalStatus
    }
}

extension UrlMetadata {
    /// Status of the url retrieval.
    ///
    /// <https://ai.google.dev/api/generate-content#UrlRetrievalStatus>
    public enum UrlRetrievalStatus: String, Codable, Sendable {
        /// Default value. This value is unused.
        case unspecified = "URL_RETRIEVAL_STATUS_UNSPECIFIED"
        /// Url retrieval is successful.
        case success = "URL_RETRIEVAL_STATUS_SUCCESS"
        /// Url retrieval is failed due to error.
        case error = "URL_RETRIEVAL_STATUS_ERROR"
        /// Url retrieval is failed because the content is behind paywall.
        case paywall = "URL_RETRIEVAL_STATUS_PAYWALL"
        /// Url retrieval is failed because the content is unsafe.
        case unsafe = "URL_RETRIEVAL_STATUS_UNSAFE"
    }
}
