/// Incremental update of the current conversation delivered from the client.
///
/// All of the content here is unconditionally appended to the conversation history and used as part of the prompt to the model to generate content.
///
/// A message here will interrupt any current model generation.
///
/// <https://ai.google.dev/api/live#bidigeneratecontentclientcontent>
public struct BidiGenerateContentClientContent: Codable, Sendable {
    /// The content appended to the current conversation with the model.
    ///
    /// For single-turn queries, this is a single instance.
    /// For multi-turn queries, this is a repeated field that contains conversation history and the latest request.
    public let turns: [Content]?
    /// If true, indicates that the server content generation should start with the currently accumulated prompt.
    /// Otherwise, the server awaits additional messages before starting generation.
    public let turnComplete: Bool?
    
    public init(turns: [Content]? = nil, turnComplete: Bool? = nil) {
        self.turns = turns
        self.turnComplete = turnComplete
    }
}
