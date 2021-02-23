import Nimble
import Quick
import XCTest
@testable import Jarvis

final class StoreTests: QuickSpec {
    override func spec() {
        describe("Store") {

            var store: Store!

            context("when add(layer:) is called") {
                it("the get(layer:) should return the concret object of the same type") {
                    let expectedValue = "\(Layer.self)"
                    store = Store()

                    store.add(layers: Layer.self)

                    expect(store.get(layer: Layer.self)?.name).to(equal(expectedValue))
                }
            }

            context("when add(plugins:on) is called") {
                it("the get(plugin:from:) should return concret plugin of the same type") {
                    let layerType = Layer.self
                    let pluginType = Plugin.self
                    let expectedValue = "\(Plugin.self)"
                    store = Store()

                    store.add(layers: layerType)
                    store.add(plugins: [pluginType], on: layerType)

                    expect(store.get(plugin: pluginType, from: layerType)?.name).to(equal(expectedValue))
                }

                it("the get(plugin:from:) should return two objects of the same type") {
                    let layerType = Layer.self
                    let pluginType = Plugin.self
                    let expectedValue = 2
                    store = Store()

                    store.add(layers: layerType)
                    store.add(plugins: [pluginType, pluginType], on: layerType)

                    expect(store.get(plugin: pluginType, from: layerType).count).to(equal(expectedValue))
                }
            }
        }
    }

    static var allTests = [
        ("spec", spec)
    ]
}
