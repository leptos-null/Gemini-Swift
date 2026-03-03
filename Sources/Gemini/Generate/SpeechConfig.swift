/// The speech generation config.
///
/// <https://ai.google.dev/api/generate-content#SpeechConfig>
public struct SpeechConfig: Codable, Sendable {
    /// The configuration in case of single-voice output.
    public let voiceConfig: VoiceConfig?
    /// The configuration for the multi-speaker setup.
    ///
    /// It is mutually exclusive with the ``SpeechConfig/voiceConfig`` field.
    public let multiSpeakerVoiceConfig: MultiSpeakerVoiceConfig?
    /// Language code (in BCP 47 format, e.g. "en-US") for speech synthesis.
    ///
    /// Valid values are:
    /// de-DE, en-AU, en-GB, en-IN, en-US, es-US, fr-FR, hi-IN, pt-BR, ar-XA,
    /// es-ES, fr-CA, id-ID, it-IT, ja-JP, tr-TR, vi-VN, bn-IN, gu-IN, kn-IN,
    /// ml-IN, mr-IN, ta-IN, te-IN, nl-NL, ko-KR, cmn-CN, pl-PL, ru-RU, and th-TH.
    public let languageCode: String?
    
    public init(voiceConfig: VoiceConfig? = nil, multiSpeakerVoiceConfig: MultiSpeakerVoiceConfig? = nil, languageCode: String? = nil) {
        self.voiceConfig = voiceConfig
        self.multiSpeakerVoiceConfig = multiSpeakerVoiceConfig
        self.languageCode = languageCode
    }
}
