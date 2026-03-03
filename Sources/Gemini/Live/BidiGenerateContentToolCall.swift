/// Request for the client to execute the ``BidiGenerateContentToolCall/functionCalls`` and return the responses with the matching `id`s.
///
/// <https://ai.google.dev/api/live#bidigeneratecontenttoolcall>
public struct BidiGenerateContentToolCall: Codable, Sendable {
    /// Output only. The function call to be executed.
    public let functionCalls: [FunctionCall]?
    
    public init(functionCalls: [FunctionCall]? = nil) {
        self.functionCalls = functionCalls
    }
}
