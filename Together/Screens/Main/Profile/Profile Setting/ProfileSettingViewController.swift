//
//  ProfileSettingViewController.swift
//  Together
//
//  Created by Евгений Шварцкопф on 20.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

final class ProfileSettingViewController: UIViewController {
    
    //MARK: - Open properties
    
    // презентору сообщаем обо всех действиях и передаем данные, например: презентер, была нажата кнопка войти,
    var presenter: ProfileSettingViewAction?
    
    
    //MARK: - Private properties
    
    //вью просим отобразить контент
    private lazy var profileSettingView = view as? ProfileSettingViewImpl
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = profileSettingView , let presenter = presenter {
            view.setPresenter(presenter)
        }
        
        setNavigation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //MARK: - Private metods
    
    //Устанавливаем навигацию, заголовок навигейшен контроллера, кнопки на навиг контроллере
    private func setNavigation() {
        navigationController?.navigationBar.isHidden = false
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationItem.title = "Редактирование профиля"
    }
    
}


extension ProfileSettingViewController: ProfileSettingViewControllerImpl {
    
    func showAlertEditProfile() {
        showBasicAlertCheck("Подтвердите изменения",
                       "Вы действительно хотите изменить свой профиль?")
    }
}
