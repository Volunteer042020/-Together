
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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(
            withIdentifier: "SignInViewController"
            ) as! SignInViewController
        
        let presenter = SignInPresenter(view: vc, coordinator: self)
        vc.presenter = presenter
        
        navController.pushViewController(vc, animated: false)
    }
    
}
