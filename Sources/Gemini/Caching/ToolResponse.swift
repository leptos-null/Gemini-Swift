/// The output from a server-side ``ToolCall`` execution.
///
/// This message contains the results of a tool invocation that was initiated by a ``ToolCall`` from the model.
/// The client should pass this `ToolResponse` back to the API in a subsequent turn within a ``Content`` message, along with the corresponding ``ToolCall``.
///
/// <https://ai.google.dev/api/caching#ToolResponse>
public struct ToolResponse: Codable, Sendable {
    // this declaration is not complete - see documentation above for all fields
}
