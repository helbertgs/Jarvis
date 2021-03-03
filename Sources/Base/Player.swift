import Foundation

@dynamicMemberLookup
class Player {
    
    // MARK: - Private Property(ies).

    private var settings: Settings
    private var state: State
    
    // MARK: Constructor(s).

    public init(with options: Option...) {
        self.settings = .init(with: options)
        self.state = .init()
    }

    internal init(with options: Option..., state: State = .init()) {
        self.settings = .init(with: options)
        self.state = state
    }
    
    // MARK: - Public Subscript(s).
    
    subscript<T>(dynamicMember keyPath: KeyPath<Settings, T>) -> T {
        get { self.settings[keyPath: keyPath] }
    }
}
