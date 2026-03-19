/// Representation of an audio chunk.
///
/// <https://ai.google.dev/api/live_music#audiochunk>
public struct AudioChunk: Codable, Sendable {
    /// Raw bytes of the audio chunk.
    public let data: Protobuf.Bytes
    /// The MIME type of the content of the audio chunk, such as "audio/wav".
    public let mimeType: String
    /// Output only. Prompts and config used for generating this audio chunk.
    public let sourceMetadata: SourceMetadata
}

extension AudioChunk {
    /// Metadata about the input source used for generating this audio chunk.
    ///
    /// <https://ai.google.dev/api/live_music#sourcemetadata>
    public struct SourceMetadata: Codable, Sendable {
        /// Weighted prompts for generating this audio chunk.
        public let clientContent: BidiGenerateMusicClientContent
        /// Music generation config for generating this audio chunk.
        public let musicGenerationConfig: BidiGenerateMusicGenerationConfig
        
        public init(clientContent: BidiGenerateMusicClientContent, musicGenerationConfig: BidiGenerateMusicGenerationConfig) {
            self.clientContent = clientContent
            self.musicGenerationConfig = musicGenerationConfig
        }
    }
}
