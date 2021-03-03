import Foundation

public class Debug: Plugin {

    // MARK: - Public Function(s).

    /// Logs a message that is helpful, but not essential, to diagnose issues with your code.
    public func log(info message: String) {
        Debugger.shared.log(info: message)
    }

    /// Logs a warning that occurred during the execution of your code.
    public func log(warning message: String) {
        Debugger.shared.log(warning: message)
    }

    /// Logs an error that occurred during the execution of your code.
    public func log(error message: String) {
        Debugger.shared.log(error: message)
    }

    /// Logs an error that occurred during the execution of your code.
    public func log(error: Error) {
        Debugger.shared.log(error: error)
    }

    /// Logs a critical error that occurred during the execution of your code.
    public func log(critical message: String) {
        Debugger.shared.log(critical: message)
    }
}
