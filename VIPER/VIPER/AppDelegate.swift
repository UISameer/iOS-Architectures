import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        /* Create ui-view-controller instance*/
        let quotesViewController = QuotesRouter.createModule()

        /* Initiating instance of ui-navigation-controller with view-controller */
        let navigationController = UINavigationController()
        navigationController.viewControllers = [quotesViewController]

        /* Setting up the root view-controller as ui-navigation-controller */
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

}

