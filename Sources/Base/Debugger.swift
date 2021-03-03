import Foundation
import os

class Debugger {

    // MARK: - Internal Property(ies).

    let logger = Logger(subsystem: "br.com.Jarvis", category: "Log")

    // MARK: - Static Property(ies).

    static let shared = Debugger()

    // MARK: - Internal Function(s).

    func log(info message: String) {
        logger.info("⚪️ \(message)")
        console(message: "⚪️ \(message)", type: "Info")
    }

    func log(warning message: String) {
        logger.warning("🟡 \(message)")
        console(message: "🟡 \(message)", type: "Warning")
    }

    func log(error message: String) {
        logger.warning("🔴 \(message)")
        console(message: "🔴 \(message)", type: "Error")
    }

    func log(error: Error) {
        logger.warning("🔴 \(error.localizedDescription)")
        console(message: "🔴 \(error.localizedDescription)", type: "Error")
    }

    func log(critical message: String) {
        logger.warning("⚫️ \(message)")
        console(message: "⚫️ \(message)", type: "Critical")
    }

    // MARK: - Private Function(s).

    private func console(message: String, type: String) {
        let text = """
        ┌───→ Logger: @\(Date())
        ├─ Type       ► \(type)
        ├─ Message    ► \(message)
        └──────────────────────────────────────────
        """

        print(text)
    }
}
