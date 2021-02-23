import Nimble
import Quick
import XCTest
@testable import Jarvis

final class StoreTests: QuickSpec {
    override func spec() {
        describe("Store") {
            context("when add(layer:) is called") {
                it("...") {
                    Store.shared.add(layers: Layer.self)
                    let expectedValue = "\(Layer.self)"
                    let layer = Store.shared.get(layer: Layer.self)

                    expect(layer?.name).to(equal(expectedValue))
                }
            }
        }
    }
}
