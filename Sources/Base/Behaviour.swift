import Foundation

public protocol Behaviour: class {

    // MARK: - Function(s).

    func awake()
    func start()
    func update()
    func reset()
    func onEnable()
    func onDisable()
    func onDestroy()
}
