import Gemini

/// Represents either a success or an error
///
/// This is a convenience type, often used as the ``ToolFunction/Output`` type
public enum VoidResultOutput: Sendable {
    case success
    case error(Swift.Error)
}

extension VoidResultOutput: SchemaProvider {
    // the schema would provide very little benefit to the model, so omit it
    public static var schema: Schema? { nil }
}

extension VoidResultOutput: ExpressibleByError {
    public init(error: Swift.Error) {
        self = .error(error)
    }
}

extension VoidResultOutput: ProtobufStructEncodable {
    public var protobufStruct: Protobuf.Struct {
        switch self {
        case .success:
            [ "status": "success" ]
        case .error(let error):
            [ "error": .string(error.localizedDescription) ]
        }
    }
}
