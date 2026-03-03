/// The SlidingWindow method operates by discarding content at the beginning of the context window.
/// The resulting context will always begin at the start of a USER role turn.
/// System instructions will always remain at the beginning of the result.
///
/// <https://ai.google.dev/api/live#slidingwindow>
public struct SlidingWindow: Codable, Sendable {
    /// The target number of tokens to keep.
    ///
    /// The default value is `trigger_tokens/2`.
    ///
    /// Discarding parts of the context window causes a temporary latency increase so this value should be calibrated to avoid frequent compression operations.
    public let targetTokens: Int64
    
    public init(targetTokens: Int64) {
        self.targetTokens = targetTokens
    }
}
