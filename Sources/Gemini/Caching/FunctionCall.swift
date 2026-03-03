/// A predicted `FunctionCall` returned from the model that contains a string representing the ``FunctionDeclaration/name`` with the arguments and their values.
///
/// <https://ai.google.dev/api/caching#FunctionCall>
public struct FunctionCall: Codable, Sendable {
    /// The unique id of the function call.
    ///
    /// If populated, the client to execute the `functionCall` and return the response with the matching ``FunctionResponse/id``.
    public let id: String?
    /// The name of the function to call.
    ///
    /// Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length of 64.
    public let name: String
    /// The function parameters and values in JSON object format.
    public let args: Protobuf.Struct?
    
    public init(id: String? = nil, name: String, args: Protobuf.Struct? = nil) {
        self.id = id
        self.name = name
        self.args = args
    }
}
