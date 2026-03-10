import Gemini

// it may seem like this file is essentially re-creating `Swift.Codable`.
// while this is partially true, creating a custom Encoder/ Decoder is significantly more code than the code below.
// Apple also went a similar direction (to the code below) with `GeneratedContent` in the Foundation Models framework

public struct ProtobufValueContainer {
    public enum PathComponent: Hashable, Sendable {
        case key(String)
        case index(Int)
    }
    
    public let value: Protobuf.Value
    public let path: [PathComponent]
    
    public init(value: Protobuf.Value, path: [PathComponent]) {
        self.value = value
        self.path = path
    }
}

extension ProtobufValueContainer.PathComponent: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .key(let key): key
        case .index(let index): "[\(index as Int)]"
        }
    }
}

public protocol ProtobufValueDecodable {
    init(protobufValueContainer: ProtobufValueContainer) throws
}

public protocol ProtobufValueEncodable {
    var protobufValue: Protobuf.Value { get }
}

public typealias ProtobufValueCodable = ProtobufValueDecodable & ProtobufValueEncodable


public struct ProtobufValueDecodingError: Swift.Error, Sendable {
    public let path: [ProtobufValueContainer.PathComponent]
    public let expectedType: SchemaType
    public let foundValue: Protobuf.Value
    
    public init(path: [ProtobufValueContainer.PathComponent], expectedType: SchemaType, foundValue: Protobuf.Value) {
        self.path = path
        self.expectedType = expectedType
        self.foundValue = foundValue
    }
    
    public init(expectedType: SchemaType, container: ProtobufValueContainer) {
        self.path = container.path
        self.expectedType = expectedType
        self.foundValue = container.value
    }
    
    var localizedDescription: String {
        let pathDescription: String = path.reduce(into: "") { partialResult, pathComponent in
            switch pathComponent {
            case .key(let key):
                if partialResult.isEmpty {
                    partialResult.append(".")
                }
                partialResult.append(key)
            case .index(let index):
                partialResult.append("[")
                partialResult.append(String(index))
                partialResult.append("]")
            }
        }
        
        return "Expected \(self.expectedType.rawValue as String) at '\(pathDescription)'"
    }
}


extension Swift.String: ProtobufValueCodable {
    public init(protobufValueContainer: ProtobufValueContainer) throws {
        guard case .string(let value) = protobufValueContainer.value else {
            throw ProtobufValueDecodingError(
                expectedType: .string,
                container: protobufValueContainer
            )
        }
        self = value
    }
    
    public var protobufValue: Protobuf.Value {
        .string(self)
    }
}

extension Swift.Double: ProtobufValueCodable {
    public init(protobufValueContainer: ProtobufValueContainer) throws {
        guard case .number(let value) = protobufValueContainer.value else {
            throw ProtobufValueDecodingError(
                expectedType: .number,
                container: protobufValueContainer
            )
        }
        self = value
    }
    
    public var protobufValue: Protobuf.Value {
        .number(self)
    }
}

extension Swift.Bool: ProtobufValueCodable {
    public init(protobufValueContainer: ProtobufValueContainer) throws {
        guard case .bool(let value) = protobufValueContainer.value else {
            throw ProtobufValueDecodingError(
                expectedType: .boolean,
                container: protobufValueContainer
            )
        }
        self = value
    }
    
    public var protobufValue: Protobuf.Value {
        .bool(self)
    }
}

extension Swift.Array: ProtobufValueDecodable where Self.Element: ProtobufValueDecodable {
    public init(protobufValueContainer: ProtobufValueContainer) throws {
        guard case .array(let value) = protobufValueContainer.value else {
            throw ProtobufValueDecodingError(
                expectedType: .array,
                container: protobufValueContainer
            )
        }
        let values: Self = try value.enumerated().map { offset, element in
            var nextPath = protobufValueContainer.path
            nextPath.append(.index(offset))
            
            let container = ProtobufValueContainer(value: element, path: nextPath)
            return try Self.Element.init(protobufValueContainer: container)
        }
        self = values
    }
}

extension Swift.Array: ProtobufValueEncodable where Self.Element: ProtobufValueEncodable {
    public var protobufValue: Protobuf.Value {
        let values: [Protobuf.Value] = self.map(\.protobufValue)
        return .array(values)
    }
}

extension Swift.Dictionary: ProtobufValueDecodable where Self.Key == String, Self.Value: ProtobufValueDecodable {
    public init(protobufValueContainer: ProtobufValueContainer) throws {
        guard case .dictionary(let value) = protobufValueContainer.value else {
            throw ProtobufValueDecodingError(
                expectedType: .object,
                container: protobufValueContainer
            )
        }
        let values: Self = try value.reduce(into: [:]) { partialResult, element in
            var nextPath = protobufValueContainer.path
            nextPath.append(.key(element.key))
            
            let container = ProtobufValueContainer(value: element.value, path: nextPath)
            let mappedValue = try Self.Value.init(protobufValueContainer: container)
            partialResult[element.key] = mappedValue
        }
        self = values
    }
}

extension Swift.Dictionary: ProtobufValueEncodable where Self.Key == String, Self.Value: ProtobufValueEncodable {
    public var protobufValue: Protobuf.Value {
        let values: [String: Protobuf.Value] = self.mapValues(\.protobufValue)
        return .dictionary(values)
    }
}

extension Protobuf.Value: ProtobufValueCodable {
    public init(protobufValueContainer: ProtobufValueContainer) throws {
        self = protobufValueContainer.value
    }
    
    public var protobufValue: Protobuf.Value {
        self
    }
}

extension Swift.Array where Self.Element == Protobuf.Value {
    public init(protobufValueContainer: ProtobufValueContainer) throws {
        guard case .array(let value) = protobufValueContainer.value else {
            throw ProtobufValueDecodingError(
                expectedType: .array,
                container: protobufValueContainer
            )
        }
        self = value
    }
    
    public var protobufValue: Protobuf.Value {
        .array(self)
    }
}

extension Swift.Dictionary where Self.Key == String, Self.Value == Protobuf.Value {
    public init(protobufValueContainer: ProtobufValueContainer) throws {
        guard case .dictionary(let value) = protobufValueContainer.value else {
            throw ProtobufValueDecodingError(
                expectedType: .object,
                container: protobufValueContainer
            )
        }
        self = value
    }
}

extension RawRepresentable /* ProtobufValueDecodable */ where Self.RawValue: ProtobufValueDecodable {
    public init(protobufValueContainer: ProtobufValueContainer) throws {
        let rawValue: RawValue = try RawValue(protobufValueContainer: protobufValueContainer)
        guard let parsedValue = Self.init(rawValue: rawValue) else {
            // we don't have a more specific error for this yet
            throw ProtobufValueDecodingError(
                path: protobufValueContainer.path,
                expectedType: .unspecified,
                foundValue: protobufValueContainer.value
            )
        }
        self = parsedValue
    }
}

extension RawRepresentable /* ProtobufValueEncodable */ where Self.RawValue: ProtobufValueEncodable {
    public var protobufValue: Protobuf.Value {
        self.rawValue.protobufValue
    }
}

extension ProtobufValueContainer {
    public func decode<T: ProtobufValueDecodable>(_ type: T.Type = T.self, forKey key: String) throws -> T {
        let dictionary: [String: Protobuf.Value] = try .init(protobufValueContainer: self)
        
        var nextPath = self.path
        nextPath.append(.key(key))
        
        let nextContainer = ProtobufValueContainer(value: dictionary[key] ?? .null, path: nextPath)
        return try T.init(protobufValueContainer: nextContainer)
    }
    
    public func decodeIfPresent<T: ProtobufValueDecodable>(_ type: T.Type = T.self, forKey key: String) throws -> T? {
        let dictionary: [String: Protobuf.Value] = try .init(protobufValueContainer: self)
        guard let value: Protobuf.Value = dictionary[key] else {
            return nil
        }
        if case .null = value {
            return nil
        }
        
        var nextPath = self.path
        nextPath.append(.key(key))
        
        let nextContainer = ProtobufValueContainer(value: dictionary[key] ?? .null, path: nextPath)
        return try T.init(protobufValueContainer: nextContainer)
    }
}

extension ProtobufValueContainer {
    public func decode<T: BinaryInteger>(_ type: T.Type = T.self, forKey key: String) throws -> T {
        let doubleValue: Double = try self.decode(forKey: key)
        return T.init(doubleValue)
    }
    
    public func decodeIfPresent<T: BinaryInteger>(_ type: T.Type = T.self, forKey key: String) throws -> T? {
        guard let doubleValue: Double = try self.decodeIfPresent(forKey: key) else {
            return nil
        }
        return T.init(doubleValue)
    }
}
