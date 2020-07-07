
import UIKit


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
    private func showMain() {
        //создаем main презентер
    }
    
    private func showSignUp() {
        
    }
    
    private func showRestorePassword() {
        
    }
    
}

