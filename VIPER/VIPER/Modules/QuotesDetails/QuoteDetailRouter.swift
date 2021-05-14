import Foundation
import UIKit

class QuoteDetailRouter: PresenterToRouterDetailProtocol {
    
    // MARK: Static methods
    static func createModule(with quote: Quote) -> UIViewController {
        print("QuoteDetailRouter creates the QuoteDetail module.")
        let view = QuotesDetailViewController()
        
        let presenter: ViewToPresenterDetailProtocol & InteractorToPresenterDetailProtocol = QuotesDetailPresenter()
        let interactor: PresenterToInteractorDetailProtocol = QuoteDetailInteractor()
        let router: PresenterToRouterDetailProtocol = QuoteDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.interactor?.quote = quote
        interactor.presenter = presenter
        
        return view
    }
    
}
