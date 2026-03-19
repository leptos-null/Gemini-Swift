/// Configuration for music generation.
///
/// <https://ai.google.dev/api/live_music#bidigeneratemusicgenerationconfig>
public struct BidiGenerateMusicGenerationConfig: Codable, Sendable {
    // this declaration is not complete - see documentation above for all fields
    
    /// Controls the variance in audio generation.
    ///
    /// Higher values produce higher variance. Range is `[0.0, 3.0]`. Default is `1.1`.
    public let temperature: Double?
    /// Controls how the model selects tokens for output.
    ///
    /// Samples the topK tokens with the highest probabilities. Range is `[1, 1000]`. Default is `40`.
    public let topK: Int?
    /// Seeds audio generation. If not set, the request uses a randomly generated seed.
    public let seed: Int?
    /// Controls how closely the model follows prompts.
    ///
    /// Higher guidance follows more closely, but will make transitions more abrupt. Range is `[0.0, 6.0]`. Default is `4.0`.
    public let guidance: Double?
    /// Beats per minute.
    ///
    /// Range is `[60, 200]`.
    public let bpm: Int?
    /// Density of sounds.
    ///
    /// Range is `[0.0, 1.0]`.
    public let density: Double?
    /// Higher value produces brighter audio.
    ///
    /// Range is `[0.0, 1.0]`.
    public let brightness: Double?
    
    public init(temperature: Double? = nil, topK: Int? = nil, seed: Int? = nil, guidance: Double? = nil, bpm: Int? = nil, density: Double? = nil, brightness: Double? = nil) {
        self.temperature = temperature
        self.topK = topK
        self.seed = seed
        self.guidance = guidance
        self.bpm = bpm
        self.density = density
        self.brightness = brightness
    }
}
