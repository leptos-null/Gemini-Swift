/// A notice that the server will soon disconnect.
///
/// <https://ai.google.dev/api/live#goaway>
public struct GoAway: Codable, Sendable {
    /// The remaining time before the connection will be terminated as ABORTED.
    ///
    /// This duration will never be less than a model-specific minimum, which will be specified together with the rate limits for the model.
    public let timeLeft: Protobuf.Duration
    
    public init(timeLeft: Protobuf.Duration) {
        self.timeLeft = timeLeft
    }
}
