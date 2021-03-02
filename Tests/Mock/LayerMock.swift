import Foundation
@testable import Jarvis

class LayerMock: Layer {

    // MARK: - Public Property(ies).

    override var required: [Plugin.Type] {
        [PluginMock.self]
    }

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
