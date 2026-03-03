/// URI based data.
///
/// <https://ai.google.dev/api/caching#FileData>
public struct FileData: Codable, Sendable {
    /// The IANA standard MIME type of the source data.
    public let mimeType: String?
    /// URI.
    public let fileUri: String
    
    public init(mimeType: String?, fileUri: String) {
        self.mimeType = mimeType
        self.fileUri = fileUri
    }
}
