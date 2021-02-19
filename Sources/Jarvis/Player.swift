import Foundation

@dynamicMemberLookup
class Player {
    
    // MARK: - Private Property(ies).

    private var settings: Settings
    private var layers: [Any]
    
    // MARK: Constructor(s).

    init(with options: Option...) {
        settings = .init(with: options)
        layers = []
    }
    
    // MARK: - Public Subscript(s).
    
    subscript<T>(dynamicMember keyPath: KeyPath<Settings, T>) -> T {
        get { settings[keyPath: keyPath] }
    }
}
