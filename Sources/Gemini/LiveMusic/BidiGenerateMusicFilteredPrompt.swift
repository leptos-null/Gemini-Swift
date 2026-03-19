/// Filtered prompt with reason.
///
/// <https://ai.google.dev/api/live_music#bidigeneratemusicfilteredprompt>
public struct BidiGenerateMusicFilteredPrompt: Codable, Sendable {
    /// Output only. The reason why the prompt was filtered.
    public let filteredReason: String?
    /// Text prompt.
    public let text: String?
}
