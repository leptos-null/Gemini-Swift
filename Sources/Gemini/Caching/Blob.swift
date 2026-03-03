/// Raw media bytes.
///
/// Text should not be sent as raw bytes, use the 'text' field.
///
/// <https://ai.google.dev/api/caching#Blob>
public struct Blob: Codable, Sendable {
    /// The IANA standard MIME type of the source data.
    ///
    /// Examples:
    /// - image/png
    /// - image/jpeg
    ///
    /// If an unsupported MIME type is provided, an error will be returned.
    /// For a complete list of supported types, see [Supported file formats](<https://ai.google.dev/gemini-api/docs/prompting_with_media#supported_file_formats>).
    public let mimeType: String
    /// Raw bytes for media formats.
    public let data: Protobuf.Bytes
    
    public init(mimeType: String, data: Protobuf.Bytes) {
        self.mimeType = mimeType
        self.data = data
    }
}
