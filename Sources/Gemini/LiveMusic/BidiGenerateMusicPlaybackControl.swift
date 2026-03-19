/// Playback control for the music generation.
///
/// <https://ai.google.dev/api/live_music#bidigeneratemusicplaybackcontrol>
public enum BidiGenerateMusicPlaybackControl: String, Codable, Sendable {
    /// This value is unused.
    case unspecified = "PLAYBACK_CONTROL_UNSPECIFIED"
    /// Start generating the music.
    case play = "PLAY"
    /// Hold the music generation. Use ``play`` to resume from the current position.
    case pause = "PAUSE"
    /// Stop the music generation and reset the context (prompts retained).
    ///
    /// Use ``play`` to restart the music generation.
    case stop = "STOP"
    /// Reset the context (prompts retained) without stopping the music generation.
    case resetContext = "RESET_CONTEXT"
}
