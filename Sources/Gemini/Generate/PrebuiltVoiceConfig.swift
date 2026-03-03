/// The configuration for the prebuilt speaker to use.
///
/// <https://ai.google.dev/api/generate-content#PrebuiltVoiceConfig>
public struct PrebuiltVoiceConfig: Codable, Sendable {
    /// The name of the preset voice to use.
    public let voiceName: String
    
    public init(voiceName: String) {
        self.voiceName = voiceName
    }
}

// per <https://ai.google.dev/gemini-api/docs/live-guide#change-voice-and-language>
// > models support any of the voices available for our [Text-to-Speech (TTS)](<https://ai.google.dev/gemini-api/docs/speech-generation#voices>) models.

extension PrebuiltVoiceConfig {
    public static let zephyr: Self = .init(voiceName: "Zephyr")
    public static let puck: Self = .init(voiceName: "Puck")
    public static let charon: Self = .init(voiceName: "Charon")
    public static let kore: Self = .init(voiceName: "Kore")
    public static let fenrir: Self = .init(voiceName: "Fenrir")
    public static let leda: Self = .init(voiceName: "Leda")
    public static let orus: Self = .init(voiceName: "Orus")
    public static let aoede: Self = .init(voiceName: "Aoede")
    public static let callirrhoe: Self = .init(voiceName: "Callirrhoe")
    public static let autonoe: Self = .init(voiceName: "Autonoe")
    public static let enceladus: Self = .init(voiceName: "Enceladus")
    public static let iapetus: Self = .init(voiceName: "Iapetus")
    public static let umbriel: Self = .init(voiceName: "Umbriel")
    public static let algieba: Self = .init(voiceName: "Algieba")
    public static let despina: Self = .init(voiceName: "Despina")
    public static let erinome: Self = .init(voiceName: "Erinome")
    public static let algenib: Self = .init(voiceName: "Algenib")
    public static let rasalgethi: Self = .init(voiceName: "Rasalgethi")
    public static let laomedeia: Self = .init(voiceName: "Laomedeia")
    public static let achernar: Self = .init(voiceName: "Achernar")
    public static let alnilam: Self = .init(voiceName: "Alnilam")
    public static let schedar: Self = .init(voiceName: "Schedar")
    public static let gacrux: Self = .init(voiceName: "Gacrux")
    public static let pulcherrima: Self = .init(voiceName: "Pulcherrima")
    public static let achird: Self = .init(voiceName: "Achird")
    public static let zubenelgenubi: Self = .init(voiceName: "Zubenelgenubi")
    public static let vindemiatrix: Self = .init(voiceName: "Vindemiatrix")
    public static let sadachbia: Self = .init(voiceName: "Sadachbia")
    public static let sadaltager: Self = .init(voiceName: "Sadaltager")
    public static let sulafat: Self = .init(voiceName: "Sulafat")
}

extension PrebuiltVoiceConfig: CaseIterable {
    public static let allCases: [Self] = [
        .zephyr, .puck, .charon,
        .kore, .fenrir, .leda,
        .orus, .aoede, .callirrhoe,
        .autonoe, .enceladus, .iapetus,
        .umbriel, .algieba, .despina,
        .erinome, .algenib, .rasalgethi,
        .laomedeia, .achernar, .alnilam,
        .schedar, .gacrux, .pulcherrima,
        .achird, .zubenelgenubi, .vindemiatrix,
        .sadachbia, .sadaltager, .sulafat,
    ]
}
