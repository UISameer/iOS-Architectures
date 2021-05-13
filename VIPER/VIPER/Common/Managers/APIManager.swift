import Foundation

class APIManager {
    
    static let shared = { APIManager() }()
    
    lazy var baseURL: String = {
        return "https://thesimpsonsquoteapi.glitch.me/"
    }()
}
