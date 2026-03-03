/// The configuration for the voice to use.
///
/// <https://ai.google.dev/api/generate-content#VoiceConfig>
public struct VoiceConfig: Sendable {
    public enum Value: Sendable {
        /// The configuration for the prebuilt voice to use.
        case prebuiltVoiceConfig(PrebuiltVoiceConfig)
    }
    
    /// The configuration for the speaker to use.
    public let value: Value
    
    public init(value: Value) {
        self.value = value
    }
}

extension VoiceConfig: Codable {
    enum CodingKeys: String, CodingKey {
        // value
        case prebuiltVoiceConfig
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container.decodeIfPresent(PrebuiltVoiceConfig.self, forKey: .prebuiltVoiceConfig) {
            self.value = .prebuiltVoiceConfig(value)
        } else {
            let allKeys: [CodingKeys] = [.prebuiltVoiceConfig]
            let keysFormatted = allKeys
                .map { "'\($0.rawValue)'" }
                .joined(separator: ", ")
            throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "Expected one of \(keysFormatted)"))
        }
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch value {
        case .prebuiltVoiceConfig(let value):
            try container.encode(value, forKey: .prebuiltVoiceConfig)
        }
    }
}
