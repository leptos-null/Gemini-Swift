/// Allow user to specify how much to think using enum instead of integer budget.
///
/// <https://ai.google.dev/api/generate-content#ThinkingLevel>
public enum ThinkingLevel: String, Codable, Sendable {
    /// Default value.
    case unspecified = "THINKING_LEVEL_UNSPECIFIED"
    /// Little to no thinking.
    case minimal = "MINIMAL"
    /// Low thinking level.
    case low = "LOW"
    /// Medium thinking level.
    case medium = "MEDIUM"
    /// High thinking level.
    case high = "HIGH"
}
