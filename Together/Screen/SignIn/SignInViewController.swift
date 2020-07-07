
import UIKit


final class SignInViewController: UIViewController {
    
    //MARK: - Open properties
    var presenter: SignInViewAction?
    
    
    //MARK: - Private properties
    private lazy var signInView = view as? SignInViewImpl
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigation()
    }
    
    
    //MARK: - Private metods
    private func setNavigation() {
        title = "SignIn"
    }
}


extension SignInViewController: SignInViewControllerImpl {
    
}




