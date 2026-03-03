/// Notification for the client that a previously issued ToolCallMessage with the specified ids should not have been executed and should be cancelled.
///
/// If there were side-effects to those tool calls, clients may attempt to undo the tool calls. This message occurs only in cases where the clients interrupt server turns.
///
/// <https://ai.google.dev/api/live#bidigeneratecontenttoolcallcancellation>
public struct BidiGenerateContentToolCallCancellation: Codable, Sendable {
    /// Output only. The ids of the tool calls to be cancelled.
    public let ids: [String]
    
    public init(ids: [String]) {
        self.ids = ids
    }
}
