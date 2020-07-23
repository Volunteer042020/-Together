//
//  ActionEventPresenter.swift
//  Together
//
//  Created by Евгений Шварцкопф on 21.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

protocol ActionEventViewAction: class {
    //фунции типа кнопка войти, забыли пароль, и тп. была нажата
}

protocol ActionEventViewControllerImpl: class {
    //функции типа показать загрузку, установить делегатов
}


final class ActionEventPresenter {
    
    //MARK: - Private properties
    private weak var view: ActionEventViewControllerImpl?
    private let coordinator: ActionEventCoordination
    
    
    //MARK: - Init
    init(view: ActionEventViewControllerImpl, coordinator: ActionEventCoordination) {
        self.view = view
        self.coordinator = coordinator
    }
}


extension ActionEventPresenter: ActionEventViewAction {
    
}
