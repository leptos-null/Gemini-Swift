/// Response from `ListModel` containing a paginated list of Models.
///
/// <https://ai.google.dev/api/models#response-body_1>
public struct ListModelsResponse: Codable, Sendable {
    /// The returned Models.
    public let models: [Model]
    /// A token, which can be sent as `pageToken` to retrieve the next page.
    ///
    /// If this field is omitted, there are no more pages.
    public let nextPageToken: String?
}
