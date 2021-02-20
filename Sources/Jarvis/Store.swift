import Foundation

public final class Store {

    // MARK: - Static Property(ies).

    static let shared = Store()

    // MARK: - Private Property(ies).

    private var items: Set<Item>

    // MARK: - Constructor(s)

    public init() {
        self.items = .init()
    }

    // MARK: - Function(s)

    public func add(layers: Layer.Type...) {
        layers.forEach {
            self.items
                .insert(.init(with: $0.init()))
        }
    }
}
