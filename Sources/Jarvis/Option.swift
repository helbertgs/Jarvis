import Foundation

enum Option {
    case chromeless(Bool)
    case fullScreen(Bool)
    case loop(Bool)
    case poster(URL)
    case source(URL)
    case start(at: TimeInterval)
    case subtitle(Locale)
}
