/// Represents token counting info for a single modality.
///
/// <https://ai.google.dev/api/generate-content#modalitytokencount>
public struct ModalityTokenCount: Codable, Sendable {
    /// The modality associated with this token count.
    public let modality: Modality
    /// Number of tokens.
    public let tokenCount: Int
    
    public init(modality: Modality, tokenCount: Int) {
        self.modality = modality
        self.tokenCount = tokenCount
    }
}
