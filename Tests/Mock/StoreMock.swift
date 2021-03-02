import Foundation
@testable import Jarvis

class StoreMock: StoreProtocol {

    // MARK: - Public Property(ies).

    var isUpdated = false
    var isStarted = false
    var isAwaked = false
    var isClear = false
    var isAddPlugin = false
    var isAddLayer = false
    var isGetPlugin = false
    var isGetPlugins = false
    var isGetLayer = false

    func clear() {
        isClear = true
    }

    func add(layers: Layer.Type...) {
        isAddLayer = true
    }

    func add(plugins: [Plugin.Type], on layer: Layer.Type) {
        isAddPlugin = true
    }

    func get<L>(layer: L.Type) -> L? where L : Layer {
        isGetLayer = true
        return nil
    }

    func get<P>(plugin: P.Type, from layer: Layer.Type) -> P? where P : Plugin {
        isGetPlugin = true
        return nil
    }

    func get(plugin: Plugin.Type, from layer: Layer.Type) -> [Plugin] {
        isGetPlugins = true
        return []
    }

    func update() {
        isUpdated = true
    }

    func start() {
        isStarted = true
    }

    func awake() {
        isAwaked = true
    }

}
