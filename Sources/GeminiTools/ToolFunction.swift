import Gemini

public protocol ExpressibleByError {
    init(error: Swift.Error)
}

public protocol ToolFunction: FunctionDeclarationProvider, Sendable where Parameters: (SchemaProvider & ProtobufValueDecodable),
                                                                          Output: (SchemaProvider & ProtobufStructEncodable & ExpressibleByError) {
    func call(parameters: Self.Parameters) async throws -> Self.Output
}


public protocol ToolVoidFunction: FunctionDeclarationProvider, Sendable where Parameters == VoidParameters,
                                                                              Output: (SchemaProvider & ProtobufStructEncodable) {
    func call() async -> Self.Output
}
