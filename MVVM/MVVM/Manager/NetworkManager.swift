import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class APIManager {
    static let shared = { APIManager() }()
    
    lazy var baseURL: String = {
        return "https://thesimpsonsquoteapi.glitch.me/"
    }()
}

class NetworkManager {
    
    var baseURL: URL?
    
    static let shared = { NetworkManager(baseUrl: APIManager.shared.baseURL) }()
    
    required init(baseUrl: String){
        self.baseURL = URL(string: baseUrl)
    }
    
    func getArray<T>(urlString: String,
                     success: @escaping (Int, [T]) -> (),
                     failure: @escaping (Int) -> ()) where T: BaseMappable {
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        
        guard let url = NSURL(string: urlString , relativeTo: self.baseURL as URL?) else {
            return
        }
        
        let urlString = url.absoluteString!
        
        Alamofire
            .request(urlString,
                     method: .get,
                     encoding: JSONEncoding.default,
                     headers: headers)
            .responseArray { (dataResponse: DataResponse<[T]>) in
                
                guard let serverResponse = dataResponse.response,
                    let resultValue = dataResponse.result.value else {
                        failure(400)
                        return
                }
                
                switch serverResponse.statusCode {
                case 200, 201:
                    success(serverResponse.statusCode, resultValue)
                default:
                    failure(serverResponse.statusCode)
                }
                
        }
        
    }
}
