import Foundation

@dynamicMemberLookup
class Player {
    
    // MARK: - Private Property(ies).

    private var settings: Settings
    
    // MARK: Constructor(s).

    public init(with options: Option...) {
        self.settings = .init(with: options)

        Store
            .shared
            .add(layers: Layer.self)
    }
    
    // MARK: - Public Subscript(s).
    
    subscript<T>(dynamicMember keyPath: KeyPath<Settings, T>) -> T {
        get { self.settings[keyPath: keyPath] }
    }
}
