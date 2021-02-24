import Foundation

public final class Store {

    // MARK: - Static Property(ies).

    static let shared = Store()

    // MARK: - Private Property(ies).

    private var layers = [Layer]()
    private var plugins = [Plugin]()

    // MARK: - Constructor(s)

    public init() { }

    // MARK: - Internal Function(s).

    func add(layers: Layer.Type...) {
        layers.forEach { [weak self] layerType in
            let layer = layerType.init()
            self?.layers.append(layer)

            layer.awake()
            self?.add(plugins: layer.required, on: layerType)
        }
    }

    func add(plugins: [Plugin.Type], on layer: Layer.Type) {
        plugins.forEach { [weak self] pluginType in
            guard let `self` = self, let layer = self.get(layer: layer) else { return }

            let plugin = pluginType.init(layer: layer)
            self.plugins.append(plugin)

            plugin.awake()
        }
    }

    func get(layer: Layer.Type) -> Layer? {
        layers.first { $0.name == "\(layer.self)" }
    }

    func get(plugin: Plugin.Type, from layer: Layer.Type) -> Plugin? {
        plugins
            .filter { $0.layer.name == "\(layer.self)" }
            .first { $0.name == "\(plugin.self)" }
    }

    func get(plugin: Plugin.Type, from layer: Layer.Type) -> [Plugin] {
        plugins
            .filter { $0.layer.name == "\(layer.self)" }
            .filter { $0.name == "\(plugin.self)" }
    }
}
