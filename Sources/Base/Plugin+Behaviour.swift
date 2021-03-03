import Foundation

extension Plugin: Behaviour {

    /// Awake is called when the script instance is being loaded.
    @objc open func awake() { }

    /// Start is called when a plugin is enabled just before any of the update function are called the first time.
    @objc open func start() { }

    /// Update is called every State is update, if the Plugin is enabled.
    @objc open func update() { }

    /// Reset to default values.
    @objc open func reset() { }

    /// This function is called when the object becomes enabled and active.
    @objc open func onEnable() { }

    /// This function is called when the Plugin becomes disabled.
    @objc open func onDisable() { }

    /// This function is callled when the Plugin is deinitialized.
    @objc open func onDestroy() { }
}
