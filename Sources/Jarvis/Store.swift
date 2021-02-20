import Foundation

final class Store {

    typealias Items = [Layer: [Any]]

    // MARK: - Static Property(ies).

    static let shared = Store()

    // MARK: - Private Property(ies).

    private var items: Items

    // MARK: - Constructor(s)

    init() {
        self.items = Items()
    }

    // MARK: - Function(s)

    func add(layers: Layer.Type...) {
        layers.forEach { self.items[$0.init()] = [] }
    }
}
