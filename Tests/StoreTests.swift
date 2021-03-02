import Nimble
import Quick
import XCTest
@testable import Jarvis

final class StoreTests: QuickSpec {
    override func spec() {
        describe("Store") {

            var store: Store!

            context("when add(layer:) is called") {
                it("should layer name be equal Layer") {
                    store = Store()

                    store.add(layers: Layer.self)
                    let layer = store.get(layer: Layer.self)

                    expect(layer?.name).to(equal("\(Layer.self)"))
                }
            }

            context("when add(plugins:on) is called") {
                it("should plugin name be equal to Plugin") {
                    store = Store()
                    store.add(layers: Layer.self)
                    store.add(plugins: [Plugin.self], on: Layer.self)

                    let plugin: Plugin? = store.get(plugin: Plugin.self, from: Layer.self)

                    expect(plugin?.name).to(equal( "\(Plugin.self)"))
                }

                it("should plugins count be equal to 2") {
                    store = Store()

                    store.add(layers: Layer.self)
                    store.add(plugins: [Plugin.self, Plugin.self], on: Layer.self)

                    let plugins = store.get(plugin: Plugin.self, from: Layer.self)
                    expect(plugins.count).to(equal(2))
                }

                it("should isUpdated from plugin be equal true") {
                    store = Store()
                    let state = State(store: store)

                    store.add(layers: LayerMock.self)
                    state.isEnable = true

                    let plugin = store?.get(plugin: PluginMock.self, from: LayerMock.self)

                    expect(plugin?.isUpdated).to(beTrue())
                }
            }
        }
    }

    static var allTests = [
        ("spec", spec)
    ]
}
