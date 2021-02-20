import Foundation

extension Store {
    public final class Item: Hashable, Equatable, Identifiable, LayerDelegate {

        // MARK: - Public Property(ies).

        public var id: UUID = { .init() }()
        private(set) var layer: Layer

        // MARK: - Constructor(s).

        init(with layer: Layer) {
            self.layer = layer
            self.layer.delegate = self

            self.bind()
        }

        // MARK: - Function(s).

        private func bind() {
        }

        // MARK: - Hashable

        public func hash(into hasher: inout Hasher) {
            hasher = .init()
        }

        // MARK: - Equatable

        public static func == (_ lhs: Item, _ rhs: Item) -> Bool {
            lhs.id == rhs.id && lhs.hashValue == rhs.hashValue
        }
    }
}
