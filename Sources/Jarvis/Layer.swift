import Foundation

public protocol LayerProtocol: class {
    func awake()
    func start()
}

public class Layer: ObservableObject, LayerProtocol {

    // MARK: - Public Property(ies).

    /// The name of the Layer.
    public lazy var name: String = { "\(Self.self)" }()

    /// The Require automatically adds required plugins as dependencies
    open lazy var required: [Plugin.Type] = { [] }()

    @Published
    public var isEnable: Bool = true

    @Published
    public var isHidden: Bool = false

    // MARK: - Constructor(s).

    public required init() { }

    // MARK: - Public Function(s).

    /// Awake is called when the Layer instance is being loaded.
    open func awake() { }
    open func start() { }

    // MARK: - Internal Function(s).

    func get(plugin: Plugin.Type) -> Plugin? {
        Store.shared.get(plugin: plugin, from: Self.self)
    }

    func get(plugin: Plugin.Type) -> [Plugin] {
        Store.shared.get(plugin: plugin, from: Self.self)
    }
}

extension Layer: Identifiable {
    public var id: UUID { .init() }
}

extension Layer: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher = .init()
    }
}

extension Layer: Equatable {
    public static func == (_ lhs: Layer, _ rhs: Layer) -> Bool {
        lhs.id == rhs.id && lhs.name == rhs.name && lhs.hashValue == rhs.hashValue
    }
}
