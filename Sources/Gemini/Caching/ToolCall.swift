/// A predicted server-side `ToolCall` returned from the model.
///
/// This message contains information about a tool that the model wants to invoke.
/// The client is NOT expected to execute this `ToolCall`.
/// Instead, the client should pass this `ToolCall` back to the API in a subsequent turn within a ``Content`` message, along with the corresponding ``ToolResponse``.
///
/// <https://ai.google.dev/api/caching#ToolCall>
public struct ToolCall: Codable, Sendable {
    // this declaration is not complete - see documentation above for all fields
}
