import Nimble
import Quick
import XCTest
@testable import Jarvis

final class PlayerTests: QuickSpec {
    override func spec() {
        describe("Player") {
            context("when init is called") {

                let urlString = "https://localhost"
                let player = Player(with:.source(URL(string: urlString)!),
                                         .fullScreen(false),
                                         .chromeless(false),
                                         .loop(false),
                                         .poster(.init(fileURLWithPath: "")),
                                         .start(at: .zero),
                                         .subtitle(.current))

                it("should source be equal localhost") {
                    expect(player.source).to(equal("https://localhost"))
                }

                it("should isFullscreen be equal false") {
                    expect(player.isFullscreen).to(beFalse())
                }

                it("should isChromeless be equal false") {
                    expect(player.isChromeless).to(beFalse())
                }

                it("should isLoop be equal false") {
                    expect(player.isLoop).to(beFalse())
                }
            }
        }
    }
}
