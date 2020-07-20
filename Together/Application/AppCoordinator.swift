
import UIKit
import CoreData


final class AppCoordinator: BaseCoordirator {
    
    // MARK: - Properties
       private let window: UIWindow
       private let navController: UINavigationController
    
    
    // MARK: - Init
     init(window: UIWindow, navController: UINavigationController) {
        self.window = window
        self.navController = navController
    }
    
    
    //MARK: - Open metods
    override func start() {
        window.rootViewController = navController
        window.makeKeyAndVisible()
        parentCoordinator = nil
        
        if UserDefaults.standard.bool(forKey: "UID") == false {
            //TODO:  -------------------------------- проверка наличия в юзер дефолтс значения по ключу isSignIn, показываем экран входа или главный
            showSignIn()
        } else {
            showMain()
        }
    }
    
    private func showSignIn() {
        let signInCoordinator = SignInCoordinator(navController: navController)
        self.setDependence(withChildCoordinator: signInCoordinator)
        signInCoordinator.start()
    }
    
    private func showMain() {
        let mainInCoordinator = MainCoordinator(navController: navController)
        navController.navigationBar.isHidden = true
        self.setDependence(withChildCoordinator: mainInCoordinator)
        mainInCoordinator.start()
    }
    
}


