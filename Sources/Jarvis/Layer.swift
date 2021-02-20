import Foundation

public protocol LayerProtocol: class {
}

public protocol LayerDelegate: class {
}

public class Layer: ObservableObject, LayerProtocol {

    // MARK: - Public Property(ies).

    public weak var delegate: LayerDelegate?

    public var name: String { "\(Self.self)" }

    @Published
    public var isEnable: Bool = true

    @Published
    public var isHidden: Bool = false

    // MARK: - Constructor(s).

    public required init() { }
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
