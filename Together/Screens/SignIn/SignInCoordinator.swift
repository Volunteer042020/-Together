
import UIKit

protocol SignInCoordination {
    
    func showMain()
    //создаем main презентер
    func showSignUp()
    
    func showRestorePassword()
    // создаем restore презетер
    
    func showRegisterAccount()
    // создаем register презентер
}

final class SignInCoordinator: BaseCoordirator {
    
    //MARK: - Private properties
    private let navController: UINavigationController
    
    
    //MARK: - Init
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    
    //MARK: - Open properties
    override func start() {
        
        let vc: SignInViewController = UIStoryboard.main.instantiate()
        
        let presenter = SignInPresenter(view: vc, coordinator: self)
        vc.presenter = presenter
        
        navController.pushViewController(vc, animated: true)
    }
    
    //MARK: - Private metods
    
}


extension SignInCoordinator: SignInCoordination {
    
    func showMain() {
        let mainCoordinator = MainCoordinator(navController: navController)
        self.setDependence(withChildCoordinator: mainCoordinator)
        mainCoordinator.start()
        self.didFinish(coordinator: self)
    }
    
    func showSignUp() {
        print("Show SignUp View")
    }
    
    func showRestorePassword() {
        let restorePasswordCoordinator = RestorePasswordCoordinator(navController: navController)
        self.setDependence(withChildCoordinator: restorePasswordCoordinator)
        restorePasswordCoordinator.start()
        self.didFinish(coordinator: self)
    }
    
    func showRegisterAccount() {
        let registerAccountCoordinator = RegisterAccountCoordinator(navController: navController)
        self.setDependence(withChildCoordinator: registerAccountCoordinator)
        registerAccountCoordinator.start()
        self.didFinish(coordinator: self)
    }
    
    
}

