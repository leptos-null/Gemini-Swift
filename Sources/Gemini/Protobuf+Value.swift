extension Protobuf {
    /// A dynamically typed value
    ///
    /// <https://protobuf.dev/reference/protobuf/google.protobuf/#value>
    public enum Value: Codable, Sendable {
        case string(String)
        case number(Double)
        case bool(Bool)
        case array([Self])
        case dictionary([String: Self])
        case null
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            
            if let string = try? container.decode(String.self) {
                self = .string(string)
            } else if let number = try? container.decode(Double.self) {
                self = .number(number)
            } else if let bool = try? container.decode(Bool.self) {
                self = .bool(bool)
            } else if let array = try? container.decode([Self].self) {
                self = .array(array)
            } else if let dictionary = try? container.decode([String: Self].self) {
                self = .dictionary(dictionary)
            } else if container.decodeNil() {
                self = .null
            } else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Value must be one of string, number, bool, array, dictionary, or null")
            }
        }
        
        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            
            switch self {
            case .string(let string):
                try container.encode(string)
            case .number(let number):
                try container.encode(number)
            case .bool(let bool):
                try container.encode(bool)
            case .array(let array):
                try container.encode(array)
            case .dictionary(let dictionary):
                try container.encode(dictionary)
            case .null:
                try container.encodeNil()
            }
        }
    }
}

extension Protobuf.Value: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = .string(value)
    }
}

extension Protobuf.Value: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = .number(value)
    }
}

extension Protobuf.Value: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = .bool(value)
    }
}

extension Protobuf.Value: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Self...) {
        self = .array(elements)
    }
}

extension Protobuf.Value: ExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (String, Self)...) {
        let dictionaryRepresentation: [String: Self] = Dictionary(elements) { currentValue, newValue in
            newValue // this is how JavaScript behaves
        }
        self = .dictionary(dictionaryRepresentation)
    }
}
