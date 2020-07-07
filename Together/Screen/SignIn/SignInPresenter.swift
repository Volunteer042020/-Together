
import Foundation


protocol SignInViewAction: class {
    //фунции типа кнопка была нажата
}

protocol SignInViewControllerImpl: class {
    //функции типа показать что-то
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
