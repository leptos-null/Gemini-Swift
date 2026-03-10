import Gemini

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public protocol ToolGenerator: FunctionDeclarationProvider, Sendable where Parameters: (SchemaProvider & ProtobufValueDecodable),
                                                                 Output: (SchemaProvider & ProtobufStructEncodable & ExpressibleByError) {
    associatedtype OutputSequence: AsyncSequence where OutputSequence.Element == Output
    
    func call(parameters: Self.Parameters) async throws -> OutputSequence
}

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
extension ToolGenerator {
    // requirement for generators
    public var behavior: FunctionDeclaration.Behavior? { .nonBlocking }
}
