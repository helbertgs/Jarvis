import Foundation

class Jarvis {
    
    // MARK: - Private Property(ies).
    
    private var url: URL = URL(fileURLWithPath: "")
    
    // MARK: Constructor(s).
    
    init (url: URL) {
        self.url = url
    }
    
    init(url: String) {
        guard let url = URL(string: url) else { return }
        self.url = url
    }
    
    // MARK: Subscript(s).
}
