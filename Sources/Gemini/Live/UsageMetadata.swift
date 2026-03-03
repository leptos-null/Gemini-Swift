/// Usage metadata about response(s).
///
/// <https://ai.google.dev/api/live#usagemetadata>
public struct UsageMetadata: Codable, Sendable {
    /// Output only. Number of tokens in the prompt.
    ///
    /// When `cachedContent` is set, this is still the total effective prompt size meaning this includes the number of tokens in the cached content.
    public let promptTokenCount: Int32
    /// Number of tokens in the cached part of the prompt (the cached content)
    public let cachedContentTokenCount: Int32
    /// Output only. Total number of tokens across all the generated response candidates.
    public let responseTokenCount: Int32
    /// Output only. Number of tokens present in tool-use prompt(s).
    public let toolUsePromptTokenCount: Int32
    /// Output only. Number of tokens of thoughts for thinking models.
    public let thoughtsTokenCount: Int32
    /// Output only. Total token count for the generation request (prompt + response candidates).
    public let totalTokenCount: Int32
    
    /// Output only. List of modalities that were processed in the request input.
    public let promptTokensDetails: [ModalityTokenCount]
    /// Output only. List of modalities of the cached content in the request input.
    public let cacheTokensDetails: [ModalityTokenCount]
    /// Output only. List of modalities that were returned in the response.
    public let responseTokensDetails: [ModalityTokenCount]
    /// Output only. List of modalities that were processed for tool-use request inputs.
    public let toolUsePromptTokensDetails: [ModalityTokenCount]
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.promptTokenCount = try container.decodeIfPresent(Int32.self, forKey: .promptTokenCount) ?? 0
        self.cachedContentTokenCount = try container.decodeIfPresent(Int32.self, forKey: .cachedContentTokenCount) ?? 0
        self.responseTokenCount = try container.decodeIfPresent(Int32.self, forKey: .responseTokenCount) ?? 0
        self.toolUsePromptTokenCount = try container.decodeIfPresent(Int32.self, forKey: .toolUsePromptTokenCount) ?? 0
        self.thoughtsTokenCount = try container.decodeIfPresent(Int32.self, forKey: .thoughtsTokenCount) ?? 0
        self.totalTokenCount = try container.decodeIfPresent(Int32.self, forKey: .totalTokenCount) ?? 0
        
        self.promptTokensDetails = try container.decodeIfPresent([ModalityTokenCount].self, forKey: .promptTokensDetails) ?? []
        self.cacheTokensDetails = try container.decodeIfPresent([ModalityTokenCount].self, forKey: .cacheTokensDetails) ?? []
        self.responseTokensDetails = try container.decodeIfPresent([ModalityTokenCount].self, forKey: .responseTokensDetails) ?? []
        self.toolUsePromptTokensDetails = try container.decodeIfPresent([ModalityTokenCount].self, forKey: .toolUsePromptTokensDetails) ?? []
    }
}
