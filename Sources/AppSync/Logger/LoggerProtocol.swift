import Foundation

public enum LogType: String {
    case error
    case warning
    case info
}

public protocol LoggerProtocol {
    func log(message: String,
             parameters: [String: String],
             type: LogType)
}

extension LoggerProtocol {
    func logInfo(_ message: String,
                 parameters: [String: String] = [:]) {
        log(message: message, parameters: parameters, type: .info)
    }
    
    func logWarning(_ message: String,
                    parameters: [String: String] = [:]) {
        log(message: message, parameters: parameters, type: .warning)
    }

    func logError(_ message: String,
                  parameters: [String: String] = [:]) {
        log(message: message, parameters: parameters, type: .error)
    }
}
