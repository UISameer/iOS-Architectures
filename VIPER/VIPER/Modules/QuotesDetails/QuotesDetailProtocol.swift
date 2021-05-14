import UIKit

protocol PresenterToViewDetailProtocol: AnyObject {
    func onGetImageFromURLSuccess(_ quote: String, character: String, image: UIImage)
    func onGetImageFromURLFailure(_ quote: String, character: String)
}

protocol ViewToPresenterDetailProtocol: AnyObject {
    
    var view: PresenterToViewDetailProtocol? { get set }
    var interactor: PresenterToInteractorDetailProtocol? { get set }
    var router: PresenterToRouterDetailProtocol? { get set }
    func viewDidLoad()
}

protocol PresenterToInteractorDetailProtocol: AnyObject {
    
    var presenter: InteractorToPresenterDetailProtocol? { get set }
    var quote: Quote? { get set }
    func getImageDataFromURL()
}

protocol InteractorToPresenterDetailProtocol: AnyObject {
    
    func getImageFromURLSuccess(quote: Quote, data: Data?)
    func getImageFromURLFailure(quote: Quote)
}

protocol PresenterToRouterDetailProtocol: AnyObject {
    static func createModule(with quote: Quote) -> UIViewController
}
