/// Config for proactivity features.
///
/// <https://ai.google.dev/api/live#proactivityconfig>
public struct ProactivityConfig: Codable, Sendable {
    /// If enabled, the model can reject responding to the last prompt.
    ///
    /// For example, this allows the model to ignore out of context speech or to stay silent if the user did not make a request, yet.
    public let proactiveAudio: Bool?
    
    public init(proactiveAudio: Bool?) {
        self.proactiveAudio = proactiveAudio
    }
}
