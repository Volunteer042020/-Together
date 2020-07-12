
import UIKit

final class SignInViewController: UIViewController {
    
    //MARK: - Open properties
    
    // презентору сообщаем обо всех действиях и передаем данные, например: презентер, была нажата кнопка войти,
    // presenter.didTappedLoginButton(email: String, password: String)
    var presenter: SignInViewAction?
    
    //MARK: - Private properties
    
    //вью просим отобразить контент
    private lazy var signInView = view as? SignInViewImpl
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = signInView, let presenter = presenter {
            view.setPresenter(presenter)
        }
        setNavigation()
    }
    
    //MARK: - Private metods
    
    //Устанавливаем навигацию, заголовок навигейшен контроллера, кнопки на навиг контроллере
    private func setNavigation() {
        self.navigationController?.navigationBar.isHidden = true
    }
}


extension SignInViewController: SignInViewControllerImpl {
    
}


