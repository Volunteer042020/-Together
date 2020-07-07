
import Foundation


protocol SignInViewAction: class {
    //фунции типа кнопка войти, забыли пароль, и тп. была нажата
}

protocol SignInViewControllerImpl: class {
    //функции типа показать загрузку, установить делегатов
}


final class SignInPresenter {
    
    //MARK: - Private properties
    private weak var view: SignInViewControllerImpl?
    private let coordinator: Coordinator
    
    
    //MARK: - Init
    init(view: SignInViewControllerImpl, coordinator: Coordinator) {
        self.view = view
        self.coordinator = coordinator
    }
}


extension SignInPresenter: SignInViewAction {
    
}
