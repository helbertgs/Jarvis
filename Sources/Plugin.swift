import Foundation

public protocol PluginProtocol: class {

    // MARK: - Property(ies).

    var isEnable: Bool { get set }

    // MARK: - Function(s).

    func awake()
}

public class Plugin: ObservableObject, PluginProtocol {

    // MARK: - Public Function(s).

    /// Enabled plugins are Updated, disabled plugins are not.
    @Published
    public var isEnable: Bool = true

    /// The name of the Plugin
    lazy var name: String = { "\(Self.self)" }()

    // MARK: - Internal Property(ies).

    unowned var layer: Layer

    // MARK: - Constructor(s).

    @available(*, unavailable)
    init() { fatalError() }

    required init(layer: Layer) {
        self.layer = layer
    }

    // MARK: - Public Function(s).

    /// Awake is called when the Layer instance is being loaded.
    open func awake() { }

    // MARK: - Internal Function(s).

    func get(plugin: Plugin.Type) -> Plugin? {
        layer.get(plugin: plugin)
    }

    func get(plugin: Plugin.Type) -> [Plugin] {
        layer.get(plugin: plugin)
    }
}
