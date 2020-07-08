//
//  RegisterAccountPresenter.swift
//  Together
//
//  Created by Евгений Шварцкопф on 08.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

protocol RegisterAccountViewAction: class {
    //фунции типа кнопка войти, забыли пароль, и тп. была нажата
    func registerAccountActionButtonTapped()
}

protocol RegisterAccountViewControllerImpl: class {
    //функции типа показать загрузку, установить делегатов
}


final class RegisterAccountPresenter {
    
    //MARK: - Private properties
    private weak var view: RegisterAccountViewControllerImpl?
    private let coordinator: RegisterAccountCoordination
    
    
    //MARK: - Init
    init(view: RegisterAccountViewControllerImpl, coordinator: RegisterAccountCoordination) {
        self.view = view
        self.coordinator = coordinator
    }
}


extension RegisterAccountPresenter: RegisterAccountViewAction {
    
    func registerAccountActionButtonTapped() {
        print("Начинаю создавать аккаунт =)")
    }
    
}
