//
//  ProfilePresenter.swift
//  Together
//
//  Created by Евгений Шварцкопф on 15.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

protocol ProfileViewAction: class {
    //фунции типа кнопка войти, забыли пароль, и тп. была нажата
}

protocol ProfileViewControllerImpl: class {
    //функции типа показать загрузку, установить делегатов
}


final class ProfilePresenter {
    
    //MARK: - Private properties
    private weak var view: ProfileViewControllerImpl?
    private let coordinator: ProfileCoordination
    
    
    //MARK: - Init
    init(view: ProfileViewControllerImpl, coordinator: ProfileCoordination) {
        self.view = view
        self.coordinator = coordinator
    }
}


extension ProfilePresenter: ProfileViewAction {
    
}
