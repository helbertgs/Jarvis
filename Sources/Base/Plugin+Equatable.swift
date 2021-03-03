import Foundation

extension Plugin: Equatable {
    public static func == (_ lhs: Plugin, _ rhs: Plugin) -> Bool {
        lhs.id == rhs.id && lhs.hashValue == rhs.hashValue
    }
}
