import Gemini

public protocol FunctionDeclarationProvider {
    associatedtype Parameters: SchemaProvider
    associatedtype Output: SchemaProvider
    
    /// The name of the function.
    ///
    /// Must be a-z, A-Z, 0-9, or contain underscores, colons, dots, and dashes, with a maximum length of 64.
    var name: String { get }
    /// A brief description of the function.
    var description: String { get }
    /// Specifies the function Behavior.
    ///
    /// Currently only supported by the `BidiGenerateContent` method.
    var behavior: FunctionDeclaration.Behavior? { get }
}

extension FunctionDeclarationProvider {
    // default implementation
    public var behavior: FunctionDeclaration.Behavior? { nil }
}

extension FunctionDeclarationProvider {
    /// The function declarations derived from the protocol conformances of this object
    public var functionDeclaration: FunctionDeclaration {
        .init(
            name: self.name,
            description: self.description,
            behavior: self.behavior,
            parameters: Parameters.schema,
            parametersJsonSchema: nil,
            response: Output.schema,
            responseJsonSchema: nil
        )
    }
}
