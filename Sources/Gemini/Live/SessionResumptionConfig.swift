/// Session resumption configuration.
///
/// This message is included in the session configuration as ``BidiGenerateContentSetup/sessionResumption``.
/// If configured, the server will send ``SessionResumptionUpdate`` messages.
///
/// <https://ai.google.dev/api/live#sessionresumptionconfig>
public struct SessionResumptionConfig: Codable, Sendable {
    /// The handle of a previous session. If not present then a new session is created.
    ///
    /// Session handles come from ``SessionResumptionUpdate/newHandle`` values in previous connections.
    public let handle: String?
    
    public init(handle: String?) {
        self.handle = handle
    }
}
