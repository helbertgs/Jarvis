import Foundation

extension Object: Equatable {
    public static func == (_ lhs: Object, _ rhs: Object) -> Bool {
        lhs.id == rhs.id && lhs.hashValue == rhs.hashValue
    }
}
