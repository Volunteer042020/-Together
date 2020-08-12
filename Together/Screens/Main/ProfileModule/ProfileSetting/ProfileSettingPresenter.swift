//
//  ProfileSettingPresenter.swift
//  Together
//
//  Created by Евгений Шварцкопф on 20.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol ProfileSettingViewAction: class {
    //фунции типа кнопка войти, забыли пароль, и тп. была нажата
    func editProfile()
}

protocol ProfileSettingViewControllerImpl: class {
    func showAlertEditProfile()
    //функции типа показать загрузку, установить делегатов
}


final class ProfileSettingPresenter {
    
    //MARK: - Private properties
    private weak var view: ProfileSettingViewControllerImpl?
    private let coordinator: ProfileSettingCoordination
    
    
    //MARK: - Init
    init(view: ProfileSettingViewControllerImpl, coordinator: ProfileSettingCoordination) {
        self.view = view
        self.coordinator = coordinator
    }
}


extension ProfileSettingPresenter: ProfileSettingViewAction {
    
    func editProfile() {
        view?.showAlertEditProfile()
    }
}
