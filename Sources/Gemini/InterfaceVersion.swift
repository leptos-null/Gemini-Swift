/// API version
///
/// <https://ai.google.dev/gemini-api/docs/api-versions>
public struct InterfaceVersion: RawRepresentable, Hashable, Sendable {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension InterfaceVersion {
    public static let v1: Self = .init(rawValue: "v1")
    public static let v1beta: Self = .init(rawValue: "v1beta")
    public static let v1alpha: Self = .init(rawValue: "v1alpha")
}
