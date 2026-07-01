import Foundation
import os.log

enum LogLevel {
    case debug
    case info
    case warning
    case error
    case critical
}

protocol LoggingProvider {
    func log(_ message: String, level: LogLevel, category: String)
}

actor LoggingService: LoggingProvider {
    
    private let osLog: OSLog
    
    init(subsystem: String = "com.sdm.youth") {
        self.osLog = OSLog(subsystem: subsystem, category: "default")
    }
    
    func log(_ message: String, level: LogLevel = .debug, category: String = "General") {
        let timestamp = ISO8601DateFormatter().string(from: Date())
        let formattedMessage = "[\(timestamp)] [\(level)] [\(category)] \(message)"
        
        let osLogType: OSLogType = {
            switch level {
            case .debug: return .debug
            case .info: return .info
            case .warning: return .default
            case .error: return .error
            case .critical: return .fault
            }
        }()
        
        os_log("%{public}@", log: osLog, type: osLogType, formattedMessage)
        
        #if DEBUG
        print(formattedMessage)
        #endif
    }
    
}
