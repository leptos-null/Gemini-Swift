import Gemini

/// Represents ``FunctionDeclarationProvider/Parameters`` when the function takes no parameters
public struct VoidParameters: SchemaProvider {
    public static var schema: Schema? { nil }
}
