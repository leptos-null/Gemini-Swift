/// Config for thinking features.
///
/// <https://ai.google.dev/api/generate-content#ThinkingConfig>
public struct ThinkingConfig: Codable, Sendable {
    /// Indicates whether to include thoughts in the response.
    ///
    /// If true, thoughts are returned only when available.
    public let includeThoughts: Bool?
    /// The number of thoughts tokens that the model should generate.
    public let thinkingBudget: Int?
    /// Controls the maximum depth of the model's internal reasoning process before it produces a response.
    ///
    /// If not specified, the default is ``ThinkingLevel/high``.
    /// Recommended for Gemini 3 or later models. Use with earlier models results in an error.
    public let thinkingLevel: ThinkingLevel?
    
    public init(includeThoughts: Bool? = nil, thinkingBudget: Int? = nil, thinkingLevel: ThinkingLevel? = nil) {
        self.includeThoughts = includeThoughts
        self.thinkingBudget = thinkingBudget
        self.thinkingLevel = thinkingLevel
    }
}
