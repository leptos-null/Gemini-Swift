import Gemini

public protocol ProtobufStructEncodable: ProtobufValueEncodable {
    var protobufStruct: Protobuf.Struct { get }
}

extension ProtobufStructEncodable {
    public var protobufValue: Protobuf.Value {
        .dictionary(protobufStruct)
    }
}

extension Protobuf.Struct: ProtobufStructEncodable {
    public var protobufStruct: Protobuf.Struct { self }
}
