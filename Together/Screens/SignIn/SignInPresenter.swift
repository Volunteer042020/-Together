
import Foundation


protocol SignInViewAction: class {
    //фунции типа кнопка войти, забыли пароль, и тп. была нажата
    func signInButtonTappedRegister()
    func signInButtonTappedLogin()
    func signInButtonTappedRestore()
}

protocol SignInViewControllerImpl: class {
    //функции типа показать загрузку, установить делегатов
}


final class SignInPresenter {
    
    //MARK: - Private properties
    private weak var view: SignInViewControllerImpl?
    private let coordinator: SignInCoordination
    
    
    //MARK: - Init
    init(view: SignInViewControllerImpl, coordinator: SignInCoordination) {
        self.view = view
        self.coordinator = coordinator
    }
}


extension SignInPresenter: SignInViewAction {
    
    func signInButtonTappedRegister() {
        coordinator.showRegisterAccount()
    }
    
    func signInButtonTappedLogin() {
        coordinator.showMain()
    }
    
    func signInButtonTappedRestore() {
        coordinator.showRestorePassword()
    }
    
    
    
}
