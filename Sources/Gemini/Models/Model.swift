/// Information about a Generative Language Model.
///
/// <https://ai.google.dev/api/models#Model>
public struct Model: Codable, Sendable {
    /// The resource name of the `Model`.
    ///
    /// Refer to [Model variants](<https://ai.google.dev/gemini-api/docs/models/gemini#model-variations>) for all allowed values.
    ///
    /// Format: `models/{model}` with a `{model}` naming convention of:
    ///
    /// - "{baseModelId}-{version}"
    ///
    /// Examples:
    ///
    /// - `models/gemini-1.5-flash-001`
    public let name: String
    /// The name of the base model, pass this to the generation request.
    ///
    /// Examples:
    ///
    /// - `gemini-1.5-flash`
    public let baseModelId: String?
    /// The version number of the model.
    ///
    /// This represents the major version (`1.0` or `1.5`)
    public let version: String
    /// The human-readable name of the model. E.g. "Gemini 1.5 Flash".
    ///
    /// The name can be up to 128 characters long and can consist of any UTF-8 characters.
    public let displayName: String
    /// A short description of the model.
    public let description: String?
    /// Maximum number of input tokens allowed for this model.
    public let inputTokenLimit: Int
    /// Maximum number of output tokens available for this model.
    public let outputTokenLimit: Int
    /// The model's supported generation methods.
    ///
    /// The corresponding API method names are defined as Pascal case strings, such as `generateMessage` and `generateContent`.
    public let supportedGenerationMethods: [String]
    /// Whether the model supports thinking.
    public let thinking: Bool?
    /// Controls the randomness of the output.
    ///
    /// Values can range over `[0.0,maxTemperature]`, inclusive. A higher value will produce responses that are more varied, while
    /// a value closer to `0.0` will typically result in less surprising responses from the model.
    /// This value specifies default to be used by the backend while making the call to the model.
    public let temperature: Double?
    /// The maximum temperature this model can use.
    public let maxTemperature: Double?
    /// For [Nucleus sampling](<https://ai.google.dev/gemini-api/docs/prompting-strategies#top-p>).
    ///
    /// Nucleus sampling considers the smallest set of tokens whose probability sum is at least `topP`.
    /// This value specifies default to be used by the backend while making the call to the model.
    public let topP: Double?
    /// For Top-k sampling.
    ///
    /// Top-k sampling considers the set of `topK` most probable tokens.
    /// This value specifies default to be used by the backend while making the call to the model.
    /// If empty, indicates the model doesn't use top-k sampling, and `topK` isn't allowed as a generation parameter.
    public let topK: Int?
}
