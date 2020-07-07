
import UIKit


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
        //TODO:  -------------------------------- проверка наличия в юзер дефолтс значения по ключу isSignIn, показываем экран входа или главный
        showSignIn()
    }
    
    private func showSignIn() {
        let signInCoordinator = SignInCoordinator(navController: navController)
        signInCoordinator.parentCoordinator = self
        signInCoordinator.start()
    }
    
    private func showMain() {
        
    }
    
}


