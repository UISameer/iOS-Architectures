import Foundation
import UIKit

class QuotesRouter: PresenterToRouterQuotesProtocol {
    
    static func createModule() -> UIViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "QuotesViewController") as! QuotesViewController
        let presenter: ViewToPresenterQuotesProtocol & InteractorToPresenterQuotesProtocol = QuotesPresenter()
        let interactor: PresenterToInteractorQuotesProtocol = QuotesInteractor()
        let router: PresenterToRouterQuotesProtocol = QuotesRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToQuoteDetail(on view: PresenterToViewQuotesProtocol, with quote: Quote) {
        print("QuotesRouter is instructed to push QuoteDetailViewController onto the navigation stack.")
        let quoteDetailViewController = QuoteDetailRouter.createModule(with: quote)
            
        let viewController = view as! QuotesViewController
        viewController.navigationController?
            .pushViewController(quoteDetailViewController, animated: true)
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main", bundle: Bundle.main)
    }
    
}
