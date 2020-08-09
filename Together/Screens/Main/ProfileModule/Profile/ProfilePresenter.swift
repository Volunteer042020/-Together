//
//  ProfilePresenter.swift
//  Together
//
//  Created by Евгений Шварцкопф on 15.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol ProfileViewAction: class, ViewAstions {
    //фунции типа кнопка войти, забыли пароль, и тп. была нажата
//    func quitProfileAndShowSignIn()
//    func showAlert()
    // потом исправим, когда появиться база данных
    func getProfileSettingView()
    func showActionEvent()
    func showCompletionEvent()
}

protocol ProfileViewControllerImpl: class {
    //функции типа показать загрузку, установить делегатов
//    func showAlertUserQuit()
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
    
    func showActionEvent() {
        coordinator.showActionEvent()
    }
    
    func showCompletionEvent() {
        coordinator.showCompletionEvent()
    }
    
    func getProfileSettingView() {
        coordinator.showProfileSetting()
    }
    
//    func showAlert() {
//        view?.showAlertUserQuit()
//    }
    
//    func quitProfileAndShowSignIn() {
//        coordinator.showSignIn()
//        print("Начинаю осуществлять переход на другой экран")
//    }
    
}
