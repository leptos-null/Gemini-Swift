/// Result of executing the ``ExecutableCode``.
///
/// Generated only when the ``CodeExecution`` tool is used.
///
/// <https://ai.google.dev/api/caching#CodeExecutionResult>
public struct CodeExecutionResult: Codable, Sendable {
    /// The identifier of the ``ExecutableCode`` part this result is for.
    ///
    /// Only populated if the corresponding ``ExecutableCode`` has an id.
    public let id: String?
    /// Outcome of the code execution.
    public let outcome: Outcome
    /// Contains stdout when code execution is successful, stderr or other description otherwise.
    public let output: String?
    
    public init(id: String?, outcome: Outcome, output: String?) {
        self.id = id
        self.outcome = outcome
        self.output = output
    }
}

extension CodeExecutionResult {
    /// Enumeration of possible outcomes of the code execution.
    ///
    /// <https://ai.google.dev/api/caching#Outcome>
    public enum Outcome: String, Codable, Sendable {
        /// Unspecified status. This value should not be used.
        case unspecified = "OUTCOME_UNSPECIFIED"
        /// Code execution completed successfully.
        ///
        /// ``CodeExecutionResult/output`` contains the stdout, if any.
        case ok = "OUTCOME_OK"
        /// Code execution failed.
        ///
        /// ``CodeExecutionResult/output`` contains the stderr and stdout, if any.
        case failed = "OUTCOME_FAILED"
        /// Code execution ran for too long, and was cancelled. There may or may not be a partial ``CodeExecutionResult/output`` present.
        case deadlineExceeded = "OUTCOME_DEADLINE_EXCEEDED"
    }
}
