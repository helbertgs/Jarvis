import Foundation

class Layer: ObservableObject {

    // MARK: - Public Property(ies).

    var name: String { "\(Self.self)" }

    @Published
    var isEnable: Bool = true

    @Published
    var isHidden: Bool = false

    // MARK: - Constructor(s).

    required init() { }
}

extension Layer: Identifiable {
    var id: UUID { .init() }
}

extension Layer: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher = .init()
    }
}

extension Layer: Equatable {
    static func == (_ lhs: Layer, _ rhs: Layer) -> Bool {
        lhs.id == rhs.id && lhs.name == rhs.name && lhs.hashValue == rhs.hashValue
    }
}
