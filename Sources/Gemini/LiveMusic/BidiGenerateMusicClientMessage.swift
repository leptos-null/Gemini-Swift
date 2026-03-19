/// Messages sent by the client
///
/// <https://ai.google.dev/api/live_music#send-messages>
public enum BidiGenerateMusicClientMessage: Sendable {
    /// Session configuration to be sent only in the first message
    case setup(BidiGenerateMusicSetup)
    /// Weighted prompts as the model input
    case clientContent(BidiGenerateMusicClientContent)
    /// Configuration for music generation
    case musicGenerationConfig(BidiGenerateMusicGenerationConfig)
    /// Playback control signals for model generation
    case playbackControl(BidiGenerateMusicPlaybackControl)
}

extension BidiGenerateMusicClientMessage: Codable {
    enum CodingKeys: String, CodingKey {
        case setup
        case clientContent
        case musicGenerationConfig
        case playbackControl
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if container.contains(.setup) {
            self = .setup(try container.decode(BidiGenerateMusicSetup.self, forKey: .setup))
        } else if container.contains(.clientContent) {
            self = .clientContent(try container.decode(BidiGenerateMusicClientContent.self, forKey: .clientContent))
        } else if container.contains(.musicGenerationConfig) {
            self = .musicGenerationConfig(try container.decode(BidiGenerateMusicGenerationConfig.self, forKey: .musicGenerationConfig))
        } else if container.contains(.playbackControl) {
            self = .playbackControl(try container.decode(BidiGenerateMusicPlaybackControl.self, forKey: .playbackControl))
        } else {
            let allKeys: [CodingKeys] = [.setup, .clientContent, .musicGenerationConfig, .playbackControl]
            let keysFormatted = allKeys
                .map { "'\($0.rawValue)'" }
                .joined(separator: ", ")
            throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "Expected one of \(keysFormatted)"))
        }
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case .setup(let bidiGenerateMusicSetup):
            try container.encode(bidiGenerateMusicSetup, forKey: .setup)
        case .clientContent(let bidiGenerateMusicClientContent):
            try container.encode(bidiGenerateMusicClientContent, forKey: .clientContent)
        case .musicGenerationConfig(let bidiGenerateMusicGenerationConfig):
            try container.encode(bidiGenerateMusicGenerationConfig, forKey: .musicGenerationConfig)
        case .playbackControl(let bidiGenerateMusicPlaybackControl):
            try container.encode(bidiGenerateMusicPlaybackControl, forKey: .playbackControl)
        }
    }
}
