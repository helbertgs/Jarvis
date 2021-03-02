import Foundation
@testable import Jarvis

class PluginMock: Plugin {

    // MARK: - Public Property(ies).

    var isUpdated = false
    var isStarted = false
    var isAwaked = false

    // MARK: - Public Function(s).

    override func awake() {
        isAwaked = true
    }

    override func start() {
        isStarted = true
    }

    override func update() {
        isUpdated = true
    }
}
