/// History configuration.
///
/// This message is included in the session configuration as ``BidiGenerateContentSetup/historyConfig``.
/// Configures the exchange of history messages.
///
/// <https://ai.google.dev/api/live#historyconfig>
public struct HistoryConfig: Codable, Sendable {
    /// If true, after sending ``BidiGenerateContentServerMessage/Payload/setupComplete(_:)``, the server will wait and at first process ``BidiGenerateContentClientMessage/clientContent(_:)`` messages until ``BidiGenerateContentClientContent/turnComplete`` is `true`.
    ///
    /// This initial history will not trigger a model call and may end with role `MODEL`.
    /// After ``BidiGenerateContentClientContent/turnComplete`` is `true`, the client can start the realtime conversation via ``BidiGenerateContentClientMessage/realtimeInput(_:)``.
    public let initialHistoryInClientContent: Bool?
    
    public init(initialHistoryInClientContent: Bool?) {
        self.initialHistoryInClientContent = initialHistoryInClientContent
    }
}
