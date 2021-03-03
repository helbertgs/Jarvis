import Nimble
import Quick
import XCTest
@testable import Jarvis

final class StateTests: QuickSpec {
    override func spec() {
        describe("State") {
            context("when isEnable of State has been changed to true") {
                it("the isEnable of InternalState should be equal true") {
                    let internalState = InternalState()
                    let state = State(with: internalState)

                    state.isEnable = true

                    expect(internalState.isEnable).to(beTrue())
                }
            }

            context("when InternalState has been initialized") {
                it("the isEnable of State should be equal isEnable of InternalState") {
                    let internalState = InternalState()
                    let state = State(with: internalState)

                    expect(state.isEnable).to(equal(internalState.isEnable))
                }
            }
        }
    }
}
