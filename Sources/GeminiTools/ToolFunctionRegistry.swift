import Foundation
import Gemini

@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public actor ToolFunctionRegistry {
    private enum Entry {
        case voidFunction(any ToolVoidFunction)
        case standardFunction(any ToolFunction)
        case generatorFunction(any ToolGenerator)
        
        var declarationProvider: any FunctionDeclarationProvider {
            switch self {
            case .voidFunction(let provider): provider
            case .standardFunction(let provider): provider
            case .generatorFunction(let provider): provider
            }
        }
    }
    
    private var functions: [String: Entry] = [:]
    
    private var activeTasks: [UUID: Task<Void, Never>] = [:]
    
    
    public var declarations: [FunctionDeclaration] {
        functions.values.map(\.declarationProvider.functionDeclaration)
    }
    
    public init() {
        
    }
    
    public func registerVoidFunction(_ function: any ToolVoidFunction) {
        if functions[function.name] != nil {
            // TODO: warn - overwrite
        }
        functions[function.name] = .voidFunction(function)
    }
    public func registerFunction(_ function: any ToolFunction) {
        if functions[function.name] != nil {
            // TODO: warn - overwrite
        }
        functions[function.name] = .standardFunction(function)
    }
    public func registerGenerator(_ generator: any ToolGenerator) {
        if functions[generator.name] != nil {
            // TODO: warn - overwrite
        }
        functions[generator.name] = .generatorFunction(generator)
    }
    
    private static func handleFunction<Function: ToolFunction>(function: Function, args: Protobuf.Struct?) async -> Function.Output {
        let container = ProtobufValueContainer(value: .dictionary(args ?? [:]), path: [])
        do {
            let parameters = try Function.Parameters.init(protobufValueContainer: container)
            return try await function.call(parameters: parameters)
        } catch {
            return .init(error: error)
        }
    }
    
    private static func handleGenerator<Generator: ToolGenerator>(
        generator: Generator, args: Protobuf.Struct?,
        yield: (_ output: Generator.Output?, _ willContinue: Bool) -> Void
    ) async -> Void {
        let container = ProtobufValueContainer(value: .dictionary(args ?? [:]), path: [])
        do {
            let parameters = try Generator.Parameters.init(protobufValueContainer: container)
            let sequence = try await generator.call(parameters: parameters)
            for try await element in sequence {
                yield(element, true)
            }
            yield(nil, false)
        } catch {
            yield(Generator.Output.init(error: error), false)
        }
    }
    
    private func attachTask(_ operation: sending @escaping @isolated(any) () async -> Void) {
        let taskID = UUID()
        activeTasks[taskID] = .init { [weak self] in
            await operation()
            
            guard let self else { return }
            await self.detachTask(id: taskID)
        }
    }
    
    private func detachTask(id: UUID) {
        self.activeTasks.removeValue(forKey: id)
    }
    
    public func handleCall(_ call: FunctionCall, sender: @escaping @Sendable (FunctionResponse) async -> Void) {
        let callName: String = call.name
        guard let entry = self.functions[callName] else {
            // TODO: log error - not found
            return
        }
        
        self.attachTask {
            switch entry {
            case .voidFunction(let voidFunction):
                let output = await voidFunction.call()
                let response = FunctionResponse(id: call.id, name: callName, response: output.protobufStruct)
                await sender(response)
            case .standardFunction(let standardFunction):
                let output = await Self.handleFunction(function: standardFunction, args: call.args)
                let response = FunctionResponse(id: call.id, name: callName, response: output.protobufStruct)
                await sender(response)
            case .generatorFunction(let generator):
                await withTaskGroup { (taskGroup: inout TaskGroup<Void>) in
                    await Self.handleGenerator(generator: generator, args: call.args) { output, willContinue in
                        let responseStruct: Protobuf.Struct = output?.protobufStruct ?? [:]
                        let response = FunctionResponse(id: call.id, name: callName, response: responseStruct)
                        
                        taskGroup.addTask {
                            await sender(response)
                        }
                    }
                    await taskGroup.waitForAll()
                }
            }
        }
    }
    
    deinit {
        for task in activeTasks.values {
            task.cancel()
        }
    }
}
