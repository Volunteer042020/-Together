//
//  MainMapPresenter.swift
//  Together
//
//  Created by Евгений Шварцкопф on 12.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

protocol MainMapViewAction: class {
    //фунции типа кнопка войти, забыли пароль, и тп. была нажата
}

protocol MainMapViewControllerImpl: class {
    //функции типа показать загрузку, установить делегатов
}


final class MainMapPresenter {
    
    //MARK: - Private properties
    private weak var view: MainMapViewControllerImpl?
    private let coordinator: MainMapCoordination
    
    
    //MARK: - Init
    init(view: MainMapViewControllerImpl, coordinator: MainMapCoordination) {
        self.view = view
        self.coordinator = coordinator
    }
}


extension MainMapPresenter: MainMapViewAction {
    
}
