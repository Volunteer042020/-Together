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
    private lazy var profileSettingView = view as? (ProfileSettingViewImpl & PresenterHaving)
    
    
    //MARK: - Life cycle
    override func loadView() {
        view = ProfileSettingView(frame: UIScreen.main.bounds)
    }
    
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
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = UIColor.customGray
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
}


extension ProfileSettingViewController: ProfileSettingViewControllerImpl {
    
    func showAlertUserQuit() {
           let alert = UIAlertController(title: "Подтвердите выход", message: "Вы действительно хотите выйти?", preferredStyle: .alert)
           let settingsAction = UIAlertAction(title: "Да", style: .default) { (alert) in
               // вызываем фукнцию перехода
               self.presenter?.quitProfileAndShowSignIn()
               // убераем таб бар
               self.tabBarController?.tabBar.isHidden = true
               print("пользователь потвердил и я выхожу из профиля")
           }
           let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { (alert) in
               self.dismiss(animated: true, completion: nil)
               print("сообственно отклонил продолжаю работу в этом профиле")
           }
           
           alert.addAction(settingsAction)
           alert.addAction(cancelAction)
           present(alert, animated: true, completion: nil)
       }
    
    func showAlertEditProfile() {
        showBasicAlertCheck("Подтвердите изменения",
                       "Вы действительно хотите изменить свой профиль?")
    }
}
