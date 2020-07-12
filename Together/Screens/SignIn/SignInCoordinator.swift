
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
        let mainMapCoordinator = MainMapCoordinator(navController: navController)
        childCoordinators.append(mainMapCoordinator)
        mainMapCoordinator.parentCoordinator = self
        mainMapCoordinator.start()
    }

    func showSignUp() {
        print("Show SignUp View")
    }

    func showRestorePassword() {
        let restorePasswordCoordinator = RestorePasswordCoordinator(navController: navController)
        childCoordinators.append(restorePasswordCoordinator)
        restorePasswordCoordinator.parentCoordinator = self
        restorePasswordCoordinator.start()
    }

    func showRegisterAccount() {
        let registerAccountCoordinator = RegisterAccountCoordinator(navController: navController)
        childCoordinators.append(registerAccountCoordinator)
        registerAccountCoordinator.parentCoordinator = self
        registerAccountCoordinator.start()
    }
    
    
}

