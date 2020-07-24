
import UIKit
import CoreData


protocol SignInShowing {
    func showSignIn()
}

protocol MainShowing {
    func showMain()
}


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
            //TODO: проверка наличия в юзер дефолтс значения по ключу isSignIn, показываем экран входа или главный
            showSignIn()
        } else {
            showMain()
        }
    }
}


//MARK: - SignInShowing
extension AppCoordinator: SignInShowing {
    
    func showSignIn() {
        let signInCoordinator = SignInCoordinator(navController: navController)
        self.setDependence(withChildCoordinator: signInCoordinator)
        signInCoordinator.start()
    }
    
}


extension AppCoordinator: MainShowing {
    
    func showMain() {
        let mainInCoordinator = MainCoordinator(navController: navController)
        self.setDependence(withChildCoordinator: mainInCoordinator)
        mainInCoordinator.start()
    }
}


