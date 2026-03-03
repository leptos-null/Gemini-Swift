/// Content Part modality
///
/// <https://ai.google.dev/api/generate-content#Modality>
public enum Modality: String, Codable, Sendable {
    /// Unspecified modality.
    case unspecified = "MODALITY_UNSPECIFIED"
    /// Plain text.
    case text = "TEXT"
    /// Image.
    case image = "IMAGE"
    /// Video.
    case video = "VIDEO"
    /// Audio.
    case audio = "AUDIO"
    /// Document, e.g. PDF.
    case document = "DOCUMENT"
}
