import Foundation

public final class Settings {
    
    // MARK: Public Property(ies).

    var source: String = ""
    var poster: String = ""
    var isChromeless = false
    var isFullscreen = false
    var isLoop = false

    // MARK: - Internal Property(ies).

    private var startAt = TimeInterval()
    private var subtitle = Locale.current

    // MARK: - Constructor(s)

    public init(with options: [Option]) {
        options.forEach {
            switch $0 {
                case .chromeless(let isChromeless): self.isChromeless = isChromeless
                case .fullScreen(let isFullscreen): self.isFullscreen = isFullscreen
                case .loop(let isLoop): self.isLoop = isLoop
                case .poster(let url): self.poster = url.absoluteString
                case .source(let url): self.source = url.absoluteString
                case .start(at: let timeInterval): self.startAt = timeInterval
                case .subtitle(let locale): self.subtitle = locale
            }
        }
    }
}
