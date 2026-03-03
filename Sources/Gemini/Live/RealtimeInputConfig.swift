/// Configures the realtime input behavior in ``BidiGenerateContentSetup``.
///
/// <https://ai.google.dev/api/live#realtimeinputconfig>
public struct RealtimeInputConfig: Codable, Sendable {
    /// If not set, automatic activity detection is enabled by default.
    /// If automatic voice detection is disabled, the client must send activity signals.
    public let automaticActivityDetection: AutomaticActivityDetection?
    /// Defines what effect activity has.
    public let activityHandling: ActivityHandling?
    /// Defines which input is included in the user's turn.
    public let turnCoverage: TurnCoverage?
    
    public init(automaticActivityDetection: AutomaticActivityDetection? = nil, activityHandling: ActivityHandling? = nil, turnCoverage: TurnCoverage? = nil) {
        self.automaticActivityDetection = automaticActivityDetection
        self.activityHandling = activityHandling
        self.turnCoverage = turnCoverage
    }
}

extension RealtimeInputConfig {
    /// Configures automatic detection of activity.
    ///
    /// <https://ai.google.dev/api/live#automaticactivitydetection>
    public struct AutomaticActivityDetection: Codable, Sendable {
        /// If enabled (the default), detected voice and text input count as activity.
        /// If disabled, the client must send activity signals.
        public let disabled: Bool?
        /// Determines how likely speech is to be detected.
        public let startOfSpeechSensitivity: StartSensitivity?
        /// The required duration of detected speech before start-of-speech is committed.
        ///
        /// The lower this value, the more sensitive the start-of-speech detection is and shorter speech can be recognized.
        /// However, this also increases the probability of false positives.
        public let prefixPaddingMs: Int32?
        /// Determines how likely detected speech is ended.
        public let endOfSpeechSensitivity: EndSensitivity?
        /// The required duration of detected non-speech (e.g. silence) before end-of-speech is committed.
        ///
        /// The larger this value, the longer speech gaps can be without interrupting the user's activity but this will increase the model's latency.
        public let silenceDurationMs: Int32?
        
        public init(
            disabled: Bool? = nil,
            startOfSpeechSensitivity: StartSensitivity? = nil,
            prefixPaddingMs: Int32? = nil,
            endOfSpeechSensitivity: EndSensitivity? = nil,
            silenceDurationMs: Int32? = nil
        ) {
            self.disabled = disabled
            self.startOfSpeechSensitivity = startOfSpeechSensitivity
            self.prefixPaddingMs = prefixPaddingMs
            self.endOfSpeechSensitivity = endOfSpeechSensitivity
            self.silenceDurationMs = silenceDurationMs
        }
    }
    
    /// The different ways of handling user activity.
    ///
    /// <https://ai.google.dev/api/live#activityhandling>
    public enum ActivityHandling: String, Codable, Sendable {
        /// If unspecified, the default behavior is ``ActivityHandling/startInterrupts``.
        case unspecified = "ACTIVITY_HANDLING_UNSPECIFIED"
        /// If true, start of activity will interrupt the model's response (also called "barge in").
        /// The model's current response will be cut-off in the moment of the interruption.
        ///
        /// This is the default behavior.
        case startInterrupts = "START_OF_ACTIVITY_INTERRUPTS"
        /// The model's response will not be interrupted.
        case noInterruption = "NO_INTERRUPTION"
    }
    
    /// Options about which input is included in the user's turn.
    ///
    /// <https://ai.google.dev/api/live#turncoverage>
    public enum TurnCoverage: String, Codable, Sendable {
        /// If unspecified, the default behavior is ``TurnCoverage/onlyActivity``.
        case unspecified = "TURN_COVERAGE_UNSPECIFIED"
        /// The users turn only includes activity since the last turn, excluding inactivity (e.g. silence on the audio stream). This is the default behavior.
        case onlyActivity = "TURN_INCLUDES_ONLY_ACTIVITY"
        /// The users turn includes all realtime input since the last turn, including inactivity (e.g. silence on the audio stream).
        case allInput = "TURN_INCLUDES_ALL_INPUT"
    }
}

extension RealtimeInputConfig.AutomaticActivityDetection {
    /// Determines how start of speech is detected.
    ///
    /// <https://ai.google.dev/api/live#startsensitivity>
    public enum StartSensitivity: String, Codable, Sendable {
        /// The default is ``StartSensitivity/high``
        case unspecified = "START_SENSITIVITY_UNSPECIFIED"
        /// Automatic detection will detect the start of speech more often.
        case high = "START_SENSITIVITY_HIGH"
        /// Automatic detection will detect the start of speech less often.
        case low = "START_SENSITIVITY_LOW"
    }
    
    /// Determines how end of speech is detected.
    ///
    /// <https://ai.google.dev/api/live#endsensitivity>
    public enum EndSensitivity: String, Codable, Sendable {
        /// The default is ``EndSensitivity/high``
        case unspecified = "END_SENSITIVITY_UNSPECIFIED"
        /// Automatic detection ends speech more often.
        case high = "END_SENSITIVITY_HIGH"
        /// Automatic detection ends speech less often.
        case low = "END_SENSITIVITY_LOW"
    }
}
