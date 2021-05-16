import Foundation

struct Endpoints {
    static let QUOTES = "quotes"
}

class QuotesViewModel {
    
    var viewDidLoad: ()->() = {}
    
    var reloadTable: ()->() = { }
    
    var numberOfRows: Int  {
        get {
            self.quotes?.count ?? 0
        }
    }
    
    var quotes: [Quote]?
    
    func configureApiCall(_ baseURL: String, _ parameter: String, _ value: String) -> String {
        return baseURL + "?" + parameter + "=" + value
    }
    
    init() {
        self.getQuotes(count: 6, success: { (code, quotes) in
            self.quotes = quotes
            self.reloadTable()
        }) { (code) in
            print("Error")
        }
    }
    
    private func getQuotes(count: Int, success: @escaping (Int, [Quote]) -> (), failure: @escaping (Int) -> ()) {
        
        let urlString = self.configureApiCall(Endpoints.QUOTES, "count", "\(count)")
        
        NetworkManager.shared.getArray(urlString: urlString, success: { (code, arrayOfQuotes) in
            success(code, arrayOfQuotes)
            
        }) { (code) in
            failure(code)
        }
    }
    
}
