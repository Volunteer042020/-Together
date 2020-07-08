
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
        
        navController.pushViewController(vc, animated: false)
    }
    
    
    //MARK: - Private metods
    
}

extension SignInCoordinator: SignInCoordination {
    
    func showMain() {
        print("Show Main View")
    }

    func showSignUp() {
        print("Show SignUp View")
    }

    func showRestorePassword() {
        print("Show Restore View")
    }

    func showRegisterAccount() {
        let registerAccountCoordinator = RegisterAccountCoordinator(navController: navController)
        childCoordinators.append(registerAccountCoordinator)
        registerAccountCoordinator.parentCoordinator = self
        registerAccountCoordinator.start()
    }
    
    
}

