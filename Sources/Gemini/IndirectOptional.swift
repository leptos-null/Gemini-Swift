/// `indirect` version of `Swift.Optional`.
///
/// This type should only be used if `Swift.Optional` is insufficient.
public indirect enum IndirectOptional<Wrapped> {
    /// The absence of a value.
    case none
    /// The presence of a value, stored as `Wrapped`.
    case some(Wrapped)
}

extension IndirectOptional: ExpressibleByNilLiteral {
    public init(nilLiteral: ()) {
        self = .none
    }
}

extension IndirectOptional: Sendable where Wrapped: Sendable {
}

extension IndirectOptional: Equatable where Wrapped: Equatable {
}

extension IndirectOptional: Encodable where Wrapped: Encodable {
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .none:
            try container.encodeNil()
        case .some(let wrapped):
            try container.encode(wrapped)
        }
    }
}

extension IndirectOptional: Decodable where Wrapped: Decodable {
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        do {
            let wrapped = try container.decode(Wrapped.self)
            self = .some(wrapped)
        } catch {
            if container.decodeNil() {
                self = .none
            } else {
                throw error
            }
        }
    }
}


extension IndirectOptional {
    public init(swiftOptional: Swift.Optional<Wrapped>) {
        switch swiftOptional {
        case .none:
            self = .none
        case .some(let wrapped):
            self = .some(wrapped)
        }
    }
    
    public var swiftOptional: Swift.Optional<Wrapped> {
        switch self {
        case .none: .none
        case .some(let wrapped): .some(wrapped)
        }
    }
}
