import Foundation

struct Endpoints {
    static let QUOTES = "quotes"
}

class QuotesViewModel {
    
    var numberOfRows: Int  {
        get {
            self.quotes?.count ?? 0
        }
    }
    
    var quotes: [Quote]? {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    
    var bindEmployeeViewModelToController : (() -> ()) = {}
    
    init() {
        self.getQuotes(count: 16, success: { (code, quotes) in
            self.quotes = quotes
        }) { (code) in
            print("Error")
        }
    }
    
    func configureApiCall(_ baseURL: String, _ parameter: String, _ value: String) -> String {
        return baseURL + "?" + parameter + "=" + value
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
