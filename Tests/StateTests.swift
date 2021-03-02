import Nimble
import Quick
import XCTest
@testable import Jarvis

final class StateTests: QuickSpec {
    override func spec() {
        describe("State") {
            context("when isEnable is true") {
                it("should isEnable from InternalState be equal true") {
                    let internalState = InternalState()
                    let state = State(with: internalState)

                    state.isEnable = true

                    expect(internalState.isEnable).to(beTrue())
                }

                it("should isUpdate from store be equal true") {
                    let internalState = InternalState()
                    let storeMock = StoreMock()
                    let state = State(with: internalState, store: storeMock)

                    state.isEnable = true

                    expect(storeMock.isUpdated).to(beTrue())
                }

                it("should isUpdate from plugin be equal true") {
                    let internalState = InternalState()
                    let store = Store()
                    let state = State(with: internalState, store: store)

                    store.add(layers: LayerMock.self)
                    state.isEnable = true

                    let plugin: PluginMock? = store.get(plugin: PluginMock.self, from: LayerMock.self)

                    expect(plugin?.name).to(equal("\(PluginMock.self)"))
                    expect(plugin?.isUpdated).to(beTrue())
                }
            }
        }
    }
}
