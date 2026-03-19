/// Message to be sent in the first (and only in the first) ``BidiGenerateMusicClientMessage``.
///
/// Clients should wait for a ``BidiGenerateMusicSetupComplete`` message before sending any additional messages.
///
/// <https://ai.google.dev/api/live_music#bidigeneratemusicsetup>
public struct BidiGenerateMusicSetup: Codable, Sendable {
    /// The model's resource name. This serves as an ID for the model to use.
    ///
    /// Format: `models/{model}`
    public let model: String
    
    public init(model: String) {
        self.model = model
    }
}
