/// User input to start or steer the music.
///
/// <https://ai.google.dev/api/live_music#bidigeneratemusicclientcontent>
public struct BidiGenerateMusicClientContent: Codable, Sendable {
    /// Weighted prompts as the model input.
    public let weightedPrompts: [WeightedPrompt]
    
    public init(weightedPrompts: [WeightedPrompt]) {
        self.weightedPrompts = weightedPrompts
    }
}

extension BidiGenerateMusicClientContent {
    /// Weighted prompt as the model input.
    ///
    /// <https://ai.google.dev/api/live_music#weightedprompt>
    public struct WeightedPrompt: Codable, Sendable {
        /// Weight of the prompt.
        ///
        /// The weight is used to control the relative importance of the prompt. Higher weights are more important than lower weights.
        ///
        /// Weights of all ``BidiGenerateMusicClientContent/weightedPrompts`` in this ``BidiGenerateMusicClientContent`` must not be all 0.
        /// Weights of all ``BidiGenerateMusicClientContent/weightedPrompts`` in this ``BidiGenerateMusicClientContent`` message will be normalized.
        public let weight: Double
        /// Text prompt.
        public let text: String
        
        public init(weight: Double, text: String) {
            self.weight = weight
            self.text = text
        }
    }
}
