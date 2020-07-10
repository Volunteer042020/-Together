//
//  RestorePasswordPresenter.swift
//  Together
//
//  Created by Евгений Шварцкопф on 09.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

protocol RestorePasswordViewAction: class {
    //фунции типа кнопка войти, забыли пароль, и тп. была нажата
}

protocol RestorePasswordViewControllerImpl: class {
    //функции типа показать загрузку, установить делегатов
}


final class RestorePasswordPresenter {
    
    //MARK: - Private properties
    private weak var view: RestorePasswordViewControllerImpl?
    private let coordinator: RestorePasswordCoordination
    
    
    //MARK: - Init
    init(view: RestorePasswordViewControllerImpl, coordinator: RestorePasswordCoordination) {
        self.view = view
        self.coordinator = coordinator
    }
}


extension RestorePasswordPresenter: RestorePasswordViewAction {
    
}
