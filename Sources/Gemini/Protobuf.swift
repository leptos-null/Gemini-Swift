import Foundation

// Namespace for Protobuf types used in the Gemini API
public enum Protobuf {}

extension Protobuf {
    /// A signed, fixed-length span of time represented as seconds.
    ///
    /// - Note: This type is designed to be `Codable` compliant with the Protobuf `Duration` type (linked below),
    /// however this type is not API compliant
    ///
    /// <https://protobuf.dev/reference/protobuf/google.protobuf/#duration>
    public struct Duration: Codable, RawRepresentable, Sendable {
        public var rawValue: TimeInterval
        
        public init(rawValue: TimeInterval) {
            self.rawValue = rawValue
        }
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            var string = try container.decode(String.self)
            guard string.popLast() == "s" else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Protobuf.Duration must end in 's'")
            }
            guard let seconds = TimeInterval(string) else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Protobuf.Duration must start with a valid number")
            }
            self.rawValue = seconds
        }
        
        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode("\(rawValue)s")
        }
    }
}

extension Protobuf {
    /// Represents the protobuf `bytes` type
    ///
    /// As described in <https://developers.google.com/discovery/v1/type-format>
    ///
    /// - Note: Requires `JSONEncoder` to use `dataEncodingStrategy = .base64` (the default)
    /// and `JSONDecoder` to use `dataDecodingStrategy = .base64` (the default)
    public typealias Bytes = Foundation.Data
}

extension Protobuf {
    /// A structured data value, consisting of fields which map to dynamically typed values.
    ///
    /// <https://protobuf.dev/reference/protobuf/google.protobuf/#struct>
    public typealias Struct = [String: Self.Value]
}
