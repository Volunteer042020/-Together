
import UIKit


class SignInViewController: UIViewController {
    
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

