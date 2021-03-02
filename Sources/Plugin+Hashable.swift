import Foundation

extension Plugin: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher = .init()
    }
}
