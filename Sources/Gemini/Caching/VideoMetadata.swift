/// Metadata describes the input video content.
///
/// <https://ai.google.dev/api/caching#VideoMetadata>
public struct VideoMetadata: Codable, Sendable {
    /// The start offset of the video.
    ///
    /// A duration in seconds with up to nine fractional digits.
    public let startOffset: Protobuf.Duration?
    /// The end offset of the video.
    ///
    /// A duration in seconds with up to nine fractional digits.
    public let endOffset: Protobuf.Duration?
    /// The frame rate of the video sent to the model.
    ///
    /// If not specified, the default value will be 1.0. The fps range is `(0.0, 24.0]`.
    public let fps: Double?
    
    public init(startOffset: Protobuf.Duration? = nil, endOffset: Protobuf.Duration? = nil, fps: Double? = nil) {
        self.startOffset = startOffset
        self.endOffset = endOffset
        self.fps = fps
    }
}
