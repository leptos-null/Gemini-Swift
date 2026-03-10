#if canImport(OSLog)

import Foundation
import Gemini
import GeminiTools
import OSLog

@available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
struct ClockGenerator: ToolGenerator {
    let name: String = "tick_tock"
    let description: String = "Send either a clock event at a given interval"
    
    enum ClockEvent: String, CaseIterable, ProtobufValueCodable {
        case tick
        case tock
    }
    
    struct Parameters: SchemaProvider, ProtobufValueDecodable {
        let event: ClockEvent
        let interval: Double
        
        init(protobufValueContainer: ProtobufValueContainer) throws {
            self.event = try protobufValueContainer.decode(forKey: "event")
            self.interval = try protobufValueContainer.decode(forKey: "interval")
        }
        
        static var schema: Schema? {
            .object(properties: [
                "event": .string(format: "enum", enum: ClockEvent.allCases.map(\.rawValue)),
                "interval": .number(description: "The interval between events, in seconds", minimum: 0.01, maximum: 100)
            ])
        }
    }
    
    enum Output: SchemaProvider, ProtobufStructEncodable, ExpressibleByError {
        case success(event: ClockEvent, dateString: String)
        case error(Swift.Error)
        
        init(error: Swift.Error) {
            self = .error(error)
        }
        
        var protobufStruct: Protobuf.Struct {
            switch self {
            case .success(let event, let dateString):
                [ "event": event.protobufValue, "t": .string(dateString) ]
            case .error(let error):
                [ "error": .string(error.localizedDescription) ]
            }
        }
        
        static var schema: Schema? { nil }
    }
    
    func call(parameters: Parameters) async throws -> AsyncThrowingStream<Output, Swift.Error> {
        let clock = ContinuousClock()
        let duration: ContinuousClock.Duration = .seconds(parameters.interval)
        
        return AsyncThrowingStream {
            try await clock.sleep(for: duration)
            let now = Date()
            return .success(event: parameters.event, dateString: now.formatted(.iso8601))
        }
    }
}

@main
struct SampleClient {
    
    @available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
    private static func availableMain() async throws {
        let logger = Logger(subsystem: "null.leptos.sample", category: "main")
        
        let registry = ToolFunctionRegistry()
        await registry.registerGenerator(ClockGenerator())
        
        await registry.handleCall(FunctionCall(name: "tick_tock", args: [ "event": "tick", "interval": 1 ])) { response in
            logger.debug("response: \(String(describing: response.response))")
        }
        
        try await Task.sleep(for: .seconds(0.5))
        
        await registry.handleCall(FunctionCall(name: "tick_tock", args: [ "event": "tock", "interval": 1 ])) { response in
            logger.debug("response: \(String(describing: response.response))")
        }
        
        try await Task.sleep(for: .seconds(5))
    }
    
    static func main() async throws {
        if #available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *) {
            try await availableMain()
            
            // 1 more second so we can see `ToolFunctionRegistry` `deinit`
            try await Task.sleep(for: .seconds(1))
        } else {
            fatalError()
        }
    }
}

#endif
