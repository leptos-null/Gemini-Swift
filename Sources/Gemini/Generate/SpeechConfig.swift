/// Config for speech generation and transcription.
///
/// <https://ai.google.dev/api/generate-content#SpeechConfig>
public struct SpeechConfig: Codable, Sendable {
    /// The configuration in case of single-voice output.
    public let voiceConfig: VoiceConfig?
    /// The configuration for the multi-speaker setup.
    ///
    /// It is mutually exclusive with the ``SpeechConfig/voiceConfig`` field.
    public let multiSpeakerVoiceConfig: MultiSpeakerVoiceConfig?
    /// The IETF [BCP-47](https://www.rfc-editor.org/rfc/bcp/bcp47.txt) language code that the user configured the app to use. Used for speech recognition and synthesis.
    ///
    /// Valid values are:
    /// `de-DE`, `en-AU`, `en-GB`, `en-IN`, `en-US`, `es-US`, `fr-FR`, `hi-IN`, `pt-BR`, `ar-XA`,
    /// `es-ES`, `fr-CA`, `id-ID`, `it-IT`, `ja-JP`, `tr-TR`, `vi-VN`, `bn-IN`, `gu-IN`, `kn-IN`,
    /// `ml-IN`, `mr-IN`, `ta-IN`, `te-IN`, `nl-NL`, `ko-KR`, `cmn-CN`, `pl-PL`, `ru-RU`, and `th-TH`.
    public let languageCode: String?
    
    public init(voiceConfig: VoiceConfig? = nil, multiSpeakerVoiceConfig: MultiSpeakerVoiceConfig? = nil, languageCode: String? = nil) {
        self.voiceConfig = voiceConfig
        self.multiSpeakerVoiceConfig = multiSpeakerVoiceConfig
        self.languageCode = languageCode
    }
}
