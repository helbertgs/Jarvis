import Foundation

public class Plugin {

    // MARK: - Public Property(ies).

    /// The Plugin name.
    public var name: String

    /// The object of the plugin is attached.
    public unowned var object: Object

    /// Defines whether the Object is active in the Scene.
    public var isActive: Bool = false

    /// Enabled Behaviours are Updated, disabled Behaviours are not.
    public var isEnable: Bool = true {
        willSet {
            newValue ? self.onEnable() : self.onDisable()
        }
    }

    // MARK: - Private Property(ies).


    // MARK: - Constructor(s).

    public required init(with object: Object) {
        self.name = "\(Self.self)"
        self.object = object
    }

    /// Unavailable constructor.
    @available(*, unavailable)
    public init() {
        fatalError("")
    }

    /// Called when the Object is destroyed.
    deinit {
        self.onDestroy()
    }

    // MARK: - Public Function(s).

    /// Returns the plugin of Type type if the object has one attached, null if it doesn't.
    public func get<P: Plugin>(plugin type: P.Type) -> P? {
        object.get(plugin: type)
    }

    /// Returns all plugins of Type type in the Object.
    public func get<P: Plugin>(plugins type: P.Type) -> [P] {
        object.get(plugins: type)
    }
}
