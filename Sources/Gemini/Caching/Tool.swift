/// Tool details that the model may use to generate response.
///
/// A Tool is a piece of code that enables the system to interact with external systems to perform an action, or set of actions, outside of knowledge and scope of the model.
///
/// <https://ai.google.dev/api/caching#Tool>
public struct Tool: Codable, Sendable {
    // this declaration is not complete - see documentation above for all fields
    
    /// A list of `FunctionDeclarations` available to the model that can be used for function calling.
    ///
    /// The model or system does not execute the function.
    /// Instead the defined function may be returned as a ``FunctionCall`` with arguments to the client side for execution.
    /// The model may decide to call a subset of these functions by populating ``FunctionCall`` in the response.
    /// The next conversation turn may contain a ``FunctionResponse`` with the ``Content/role`` "function" generation context for the next model turn.
    public let functionDeclarations: [FunctionDeclaration]?
    
    public init(functionDeclarations: [FunctionDeclaration]? = nil) {
        self.functionDeclarations = functionDeclarations
    }
}
