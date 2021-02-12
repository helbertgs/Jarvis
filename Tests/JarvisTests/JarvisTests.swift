import Nimble
import Quick
import XCTest
@testable import Jarvis

final class JarvisTests: QuickSpec {
    override func spec() {
        describe("Jaris") {
            context("when init") {
                it("the text value should be equal to 'Hello, World!'") {
                    expect(Jarvis().text).to(equal("Hello, World!"))
                }
            }
        }
    }

    static var allTests = [
        ("spec", spec),
    ]
}
