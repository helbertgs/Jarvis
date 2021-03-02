import Foundation

public class Object {

    // MARK: - Public Property(ies).

    /// The name of the object.
    public var name: String

    /// Enabled Behaviours are Updated, disabled Behaviours are not.
    public var isEnable: Bool

    // MARK: - Private Property(ies).

    /// List of plugins attached in the Object.
    private var plugins: [Plugin]

    // MARK: - Constructor(s).

    /// Creates a new object, named name.
    public init(name: String) {
        self.name = name
        self.isEnable = true
        self.plugins = []
    }

    /// Creates a new object, named Object.
    public convenience init() {
        self.init(name: "\(Self.self)")
    }

    // MARK: - Public Function(s).

    /// Adds a plugin class named plugin to the object.
    @discardableResult
    public func add<P: Plugin>(plugin type: P.Type) -> Plugin {
        let plugin = type.init(with: self)
        plugins.append(plugin)

        return plugin
    }

    /// Returns the plugin of Type type if the object has one attached, null if it doesn't.
    public func get<P: Plugin>(plugin type: P.Type) -> P? {
        plugins
            .first { $0.name == "\(type.self)" }
            .map { $0 as! P }
    }

    /// Returns all plugins of Type type in the Object.
    public func get<P: Plugin>(plugins type: P.Type) -> [P] {
        plugins
            .filter { $0.name == "\(type.self)" }
            .map { $0 as! P }
    }

    /// Calls the method named method on every Plugin in this object or any of its children.
    public func broadcast(method: String) { }

    /// Calls the method named method on every Plugin in this object.
    public func send(method: String) { }
}
