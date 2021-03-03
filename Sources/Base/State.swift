import Foundation

class InternalState {

    // MARK: - Public Property(ies).

    var isEnable: Bool = false

    // MARK: - Constructor(s).

    init() { }
}

@dynamicMemberLookup
final class State {

    // MARK: - Private Property(ies).

    private var _state: InternalState

    // MARK: - Constructor(s).

    init(with state: InternalState = .init()) {
        self._state = state
    }

    // MARK: - Subscript(s).

    subscript<Value>(dynamicMember keyPath: WritableKeyPath<InternalState, Value>) -> Value {
        get { _state[keyPath: keyPath] }
        set { _state[keyPath: keyPath] = newValue }
    }
}
