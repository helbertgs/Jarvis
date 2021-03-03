import Foundation

extension Object: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher = .init()
    }
}
