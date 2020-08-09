//
//  ProfileSettingPresenter.swift
//  Together
//
//  Created by Евгений Шварцкопф on 20.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol ProfileSettingViewAction: class, ViewAstions {
    //фунции типа кнопка войти, забыли пароль, и тп. была нажата
    func editProfile()
    func quitProfileAndShowSignIn()
    func showAlert()
}

protocol ProfileSettingViewControllerImpl: class {
    func showAlertEditProfile()
    func showAlertUserQuit()
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
    
    func showAlert() {
        view?.showAlertUserQuit()
    }
    
    func quitProfileAndShowSignIn() {
        coordinator.showSignIn()
        print("Начинаю осуществлять переход на другой экран")
    }
    
    func editProfile() {
        view?.showAlertEditProfile()
    }
}
