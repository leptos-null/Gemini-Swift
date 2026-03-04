/// Result of executing the ``ExecutableCode``.
///
/// Only generated when using the ``CodeExecution``, and always follows a `part` containing the ``ExecutableCode``.
///
/// <https://ai.google.dev/api/caching#CodeExecutionResult>
public struct CodeExecutionResult: Codable, Sendable {
    /// Outcome of the code execution.
    public let outcome: Outcome
    /// Contains stdout when code execution is successful, stderr or other description otherwise.
    public let output: String?
    
    public init(outcome: Outcome, output: String? = nil) {
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
        case ok = "OUTCOME_OK"
        /// Code execution finished but with a failure. `stderr` should contain the reason.
        case failed = "OUTCOME_FAILED"
        /// Code execution ran for too long, and was cancelled. There may or may not be a partial output present.
        case deadlineExceeded = "OUTCOME_DEADLINE_EXCEEDED"
    }
}
