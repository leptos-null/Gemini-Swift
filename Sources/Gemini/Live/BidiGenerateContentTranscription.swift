/// Transcription of audio (input or output).
///
/// <https://ai.google.dev/api/live#bidigeneratecontenttranscription>
public struct BidiGenerateContentTranscription: Codable, Sendable {
    /// Transcription text.
    public let text: String
    
    public init(text: String) {
        self.text = text
    }
}
