//
//  SlideMenuViewPresenter.swift
//  Together
//
//  Created by Евгений Шварцкопф on 03.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

protocol SlideMenuViewAction: class, ViewAstions {
     //фунции типа кнопка войти, забыли пароль, и тп. была нажата
}

protocol SlideMenuViewControllerImpl: class {
    //функции типа показать загрузку, установить делегатов
}


final class SlideMenuPresenter {
    
    //MARK: - Private properties
    private weak var view: SlideMenuViewControllerImpl?
    private let coordinator: SlideMenuCoordination
    
    
    //MARK: - Init
    init(view: SlideMenuViewControllerImpl, coordinator: SlideMenuCoordination) {
        self.view = view
        self.coordinator = coordinator
    }
}


extension SlideMenuPresenter: SlideMenuViewAction {
    
    
}
