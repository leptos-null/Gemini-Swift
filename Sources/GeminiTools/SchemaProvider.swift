import Gemini

/// A type that describes its encoding or decoding behavior as a `Schema`
public protocol SchemaProvider {
    static var schema: Schema? { get }
}
