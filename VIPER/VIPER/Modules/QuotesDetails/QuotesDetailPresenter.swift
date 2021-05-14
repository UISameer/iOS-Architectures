import UIKit

class QuotesDetailPresenter: ViewToPresenterDetailProtocol {
    var view: PresenterToViewDetailProtocol?
    
    var interactor: PresenterToInteractorDetailProtocol?
    
    var router: PresenterToRouterDetailProtocol?
    
    func viewDidLoad() {
        interactor?.getImageDataFromURL()
    }
}

extension QuotesDetailPresenter: InteractorToPresenterDetailProtocol {
    func getImageFromURLSuccess(quote: Quote, data: Data?) {
        view?.onGetImageFromURLSuccess(quote.quote!, character: quote.character!, image: ImageDataService.shared.convertToUIImage(from: data!))
    }
    
    func getImageFromURLFailure(quote: Quote) {
        view?.onGetImageFromURLFailure(quote.quote!, character: quote.character!)
    }
}
