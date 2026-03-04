/// Config for image generation features.
///
/// <https://ai.google.dev/api/generate-content#ImageConfig>
public struct ImageConfig: Codable, Sendable {
    /// The aspect ratio of the image to generate.
    ///
    /// Supported aspect ratios: `1:1`, `2:3`, `3:2`, `3:4`, `4:3`, `4:5`, `5:4`, `9:16`, `16:9`, or `21:9`.
    ///
    /// If not specified, the model will choose a default aspect ratio based on any reference images provided.
    public let aspectRatio: String?
    /// Specifies the size of generated images.
    ///
    /// Supported values are `1K`, `2K`, `4K`. If not specified, the model will use default value `1K`.
    public let imageSize: String?
    
    public init(aspectRatio: String? = nil, imageSize: String? = nil) {
        self.aspectRatio = aspectRatio
        self.imageSize = imageSize
    }
}
