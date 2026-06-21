/// Raw media bytes.
///
/// Text should not be sent as raw bytes, use the 'text' field.
///
/// <https://ai.google.dev/api/caching#Blob>
public struct Blob: Codable, Hashable, Sendable {
    /// The IANA standard MIME type of the source data.
    ///
    /// Examples of supported types:
    /// - Images: image/png, image/jpeg, image/jpg, image/webp, image/heic, image/heif, image/gif, image/avif
    /// - Audio: audio/\*, video/audio/s16le, video/audio/wav
    /// - Video: video/\*
    /// - Text: text/plain, text/html, text/css, text/javascript, text/x-typescript, text/csv, text/markdown, text/x-python, text/xml, text/rtf, video/text/timestamp
    /// - Applications: application/x-javascript, application/x-typescript, application/x-python-code, application/json, application/x-ipynb+json, application/rtf, application/pdf
    ///
    /// For additional context, see [Supported file formats](<https://ai.google.dev/gemini-api/docs/file-input-methods#supported-content-types>).
    public let mimeType: String
    /// Raw bytes for media formats.
    public let data: Protobuf.Bytes
    
    public init(mimeType: String, data: Protobuf.Bytes) {
        self.mimeType = mimeType
        self.data = data
    }
}
